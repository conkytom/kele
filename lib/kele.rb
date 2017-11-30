require 'httparty'
require 'json'

class Kele
    include HTTParty

    def initialize(email, pass)
        @base_url = 'https://www.bloc.io/api/v1'           
        response = self.class.post(@base_url+"/sessions", body: {"email": email, "password": pass})
        @auth_token = response["auth_token"]
        if @auth_token == nil
            puts "There was an error in your username or password."
        end
        @auth_token
    end

    def get_me
        @user_url = 'https://www.bloc.io/api/v1/users/me'
        response = self.class.get(@base_url+"/users/me", headers: { "authorization" => @auth_token })
        j_response = JSON.parse(response.body)
    end
end