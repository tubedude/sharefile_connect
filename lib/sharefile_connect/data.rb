module SharefileConnect
  class Data
    include HTTParty
    include HTTMultiParty

    def root(id = 'allshared')
      parse_get("/Items(#{id})?$expand=Children&$select=Id,Name,Children/Id,Children/Name").body
      # parse_anwser("/Items(#{id})?$expand=Children")
    end

    def folder_access_info(id)
      parse_get("/Items(#{id})/Info").body
    end

    def items_by_path(paths)
      parse_get("/Items/ByPath?path=/#{paths.join('/')}/&$expand=Children&$select=Id,Name,Children/Id,Children/Name").body
    end

    def upload_file folder_id, file_path
      path          = "/Items(#{folder_id})/Upload"
      response      = HTTParty.get(full(path), headers: authorization_header)
      upload_config = JSON.parse response.body
      multipart_form_post upload_config['ChunkUri'], file_path
      # HTTMultiParty.post(upload_config["ChunkUri"], body: { file1: File.new(file_path) } )
      # File.open(file_path) do |transfile|
      #   # HTTMultiParty.post(upload_config["ChunkUri"], query: { file1: File.read(transfile) })
      #   # HTTMultiParty.post(upload_config["ChunkUri"], query: { file1: UploadIO.new(transfile, "multipart/formdata", File.basename(file_path)) })
      #   # HTTMultiParty.post(upload_config["ChunkUri"], query: { file1: UploadIO.new(File.open(file_path), "multipart/formdata") })
      # end
    end

    private

    def multipart_form_post url, file_path
      newline = "\r\n"
      filename = File.basename(file_path)
      boundary = "----------#{Time.now.nsec}"

      uri = URI.parse(url)

      post_body = []
      post_body << "--#{boundary}#{newline}"
      post_body << "Content-Disposition: form-data; name=\"File1\"; filename=\"#{filename}\"#{newline}"
      post_body << "Content-Type: application/octet-stream#{newline}"
      post_body << "#{newline}"
      post_body << File.read(file_path)
      post_body << "#{newline}--#{boundary}--#{newline}"

      request = Net::HTTP::Post.new(uri.request_uri)
      request.body = post_body.join
      request["Content-Type"] = "multipart/form-data, boundary=#{boundary}"
      request['Content-Length'] = request.body().length

      http = Net::HTTP.new uri.host, uri.port
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      response = http.request request
      return response
    end


    def connection
      @connection ||= SharefileConnect::Connection.new.token
    end

    def full path
      "#{BASE_URI}#{path}"
    end

    def parse_get(path)
      JSON.parse HTTParty.get(full(path), headers: authorization_header)
    end

    def authorization_header
      return { "Authorization" => "Bearer #{connection['access_token']}" }
    end


  end
end
