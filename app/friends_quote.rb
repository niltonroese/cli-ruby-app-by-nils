class FriendsQuote
    
    @@all = []

    attr_accessor :character, :quote

    # def initialize(character, quote)
    #     @character = character
    #     @quote = quote
    #     save 
    # end

    def initialize(quote_hash)
        quote_hash.each do |k, v|
            self.send("#{k}=", v) if self.respond_to?("#{k}=")
        end
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    # method to accepts friends name and find object(quote)

    def self.find_quote(friend_name)
        self.all.find do |friend|
            friend.character == friend_name
        end
    end


end