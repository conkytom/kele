require 'httparty'

class Kele
    include HTTParty

    def initialize(email, pass)
        @base_url = 'https://www.bloc.io/api/v1'           
        response = self.class.post("https://www.bloc.io/api/v1/sessions", body: {"email": email, "password": pass})
        @auth_token = response["auth_token"]
        if @auth_token == nil
            puts "There was an error in your username or password."
        end
        
    end
end