module SharefileConnect
  class Connection
    attr_reader :token, :config
    include HTTParty
    # base_uri "https://#{ENV['API_ENDPOINT_DOMAIN']}.sf-api.com"

    def initialize(config)
      @config = config  # || SharefileConnect::Config.new(ENV['SHAREFILE_KEY'],  ENV['SHAREFILE_SECRET'], ENV['SHAREFILE_USER_NAME'], ENV['SHAREFILE_USER_PASS'], ENV['API_ENDPOINT_DOMAIN'])
      response = HTTParty.post(authentication_uri, authentication_content)
      @token = JSON.parse response.body
    end

    def hostname
      "#{config.domain}.sf-api.com"
    end

    def authentication_uri
      "https://#{hostname}/oauth/token"
      # "/oauth/token"
    end

    def authentication_content
      {
      :body => {
          "grant_type"    => "password",
          "client_id"     => config.sharefile_key,
          "client_secret" => config.sharefile_secret,
          "username"      => config.sharefile_user,
          "password"      => config.sharefile_user_pass
      },
          :headers => {
          "Content-Type" => "application/x-www-form-urlencoded"
      }
      }
    end

  end
end
