class API 
    
    def self.get_data
        response = RestClient.get('https://friends-quotes-api.herokuapp.com/quotes/')
        quotes_array = JSON.parse(response)
        quotes_array.each do |quote|
            FriendsQuote.new(quote)
        end
    end


end