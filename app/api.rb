class API
    
    def self.get_data
        response = RestClient.get('https://friends-quotes-api.herokuapp.com/quotes/')
        JSON.parse(response)
    end
end