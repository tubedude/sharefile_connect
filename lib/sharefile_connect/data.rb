module SharefileConnect
  class Data
    attr_accessor :config
    include HTTParty


    def initialize(config = nil)
      @config = config || SharefileConnect::Config.new(ENV['SHAREFILE_KEY'], ENV['SHAREFILE_SECRET'], ENV['SHAREFILE_USER_NAME'], ENV['SHAREFILE_USER_PASS'], ENV['API_ENDPOINT_DOMAIN'])
    end

    def root(id = nil)
      parse_get("/Items(#{id || 'allshared'})?$expand=Children&$select=Id,Name,Children/Id,Children/Name").body
    end

    def folder_access_info(id)
      parse_get("/Items(#{id})/Info").body
    end

    def item(id)
      get("/Items(#{id})")
    end

    # def create_folder parent_id, name, description = ''
    #   unless folder_exists?(name, parent_id)
    #     body = {
    #         "Name"        => name,
    #         "Description" => description || name
    #     }
    #     HTTParty.post(full("Items#{parent_id}/Folder?overwrite=false&passthrough=false"), { body: body.to_json, headers: authorization_header})
    #   else
    #     item(folder_in_parent(name, parent_id)['Id'])
    #   end
    # end

    def folder_exists?(name, parent_id = nil)
      folder_in_parent(name, parent_id).any?
    end

    def folder_in_parent(name, parent_id)
      JSON.parse(root(parent_id))['Children'].select { |f| f['Name'] == name }
    end

    def items_by_path(paths)
      parse_get("/Items/ByPath?path=/#{paths.join('/')}/&$expand=Children&$select=Id,Name,Children/Id,Children/Name")
    end

    def items_by_path_id(paths)
      r = items_by_path(paths).response
      JSON.parse(r.body)['Id'] if r.kind_of?(Net::HTTPOK)
    end

    def upload_file_from_path(folder_id, file_path)
      path          = "/Items(#{folder_id})/Upload"
      response      = get(path)
      upload_config = JSON.parse response.body
      multipart_form_post upload_config['ChunkUri'], File.read(file_path), File.basename(file_path)
      # HTTMultiParty.post(upload_config["ChunkUri"], body: { file1: File.new(file_path) } )
      # File.open(file_path) do |transfile|
      #   # HTTMultiParty.post(upload_config["ChunkUri"], query: { file1: File.read(transfile) })
      #   # HTTMultiParty.post(upload_config["ChunkUri"], query: { file1: UploadIO.new(transfile, "multipart/formdata", File.basename(file_path)) })
      #   # HTTMultiParty.post(upload_config["ChunkUri"], query: { file1: UploadIO.new(File.open(file_path), "multipart/formdata") })
      # end
    end

    def upload_file(folder_id, file, file_name)
      path          = "/Items(#{folder_id})/Upload"
      response      = get(path)
      upload_config = JSON.parse response.body
      multipart_form_post upload_config['ChunkUri'], file, file_name
    end

    def zones
      get("/Zones")
    end

    def zone_id
      JSON.parse(zones.response.body)['value'].map { |x| x['Id'] if x['ZoneType'] == 'CitrixManaged' }.compact.first
    end

    private

    def multipart_form_post(url, file, file_name)
      newline  = "\r\n"
      filename = file_name
      boundary = "----------#{Time.now.nsec}"

      uri = URI.parse(url)

      post_body = []
      post_body << "--#{boundary}#{newline}"
      post_body << "Content-Disposition: form-data; name=\"File1\"; filename=\"#{filename}\"#{newline}"
      post_body << "Content-Type: application/octet-stream#{newline}"
      post_body << "#{newline}"
      post_body << file
      post_body << "#{newline}--#{boundary}--#{newline}"

      request                   = Net::HTTP::Post.new(uri.request_uri)
      request.body              = post_body.join
      request['Content-Type']   = "multipart/form-data, boundary=#{boundary}"
      request['Content-Length'] = request.body().length

      http             = Net::HTTP.new uri.host, uri.port
      http.use_ssl     = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      http.request request
    end


    def connection
      @connection ||= SharefileConnect::Connection.new(config).token
    end

    def full path
      "https://#{config.domain}.sf-api.com/sf/v3#{path}"
    end

    def parse_get(path)
      get(path)
    end

    def get(path)
      HTTParty.get(full(path), headers: authorization_header)
    end

    def authorization_header
      return { "Authorization" => "Bearer #{connection['access_token']}" }
    end

  end
end
