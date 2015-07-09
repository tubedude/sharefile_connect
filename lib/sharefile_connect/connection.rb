module SharefileConnect
  class Connection
    attr_reader :token
    include HTTParty
    # base_uri "https://#{ENV['API_ENDPOINT_DOMAIN']}.sf-api.com"

    def initialize
      response = HTTParty.post(authentication_uri, authentication_content)
      @token = JSON.parse response.body
    end

    def hostname
      "#{ENV['API_ENDPOINT_DOMAIN']}.sf-api.com"
    end

    def authentication_uri
      "https://#{hostname}/oauth/token"
      # "/oauth/token"
    end

    def authentication_content
      {
      :body => {
          "grant_type"    => "password",
          "client_id"     => ENV['SHAREFILE_KEY'],
          "client_secret" => ENV['SHAREFILE_SECRET'],
          "username"      => ENV['USER_NAME'],
          "password"      => ENV['USER_PASS']
      },
          :headers => {
          "Content-Type" => "application/x-www-form-urlencoded"
      }
      }
    end

  end
end
