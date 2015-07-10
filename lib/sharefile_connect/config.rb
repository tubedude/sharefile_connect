module SharefileConnect
  class Config
    attr_accessor :sharefile_key, :sharefile_secret, :sharefile_user, :sharefile_user_pass, :domain
    def initialize(sharefile_key, sharefile_secret, sharefile_user, sharefile_user_pass, domain)
      @sharefile_key, @sharefile_secret, @sharefile_user, @sharefile_user_pass, @domain = sharefile_key, sharefile_secret, sharefile_user, sharefile_user_pass, domain
    end
  end
end
