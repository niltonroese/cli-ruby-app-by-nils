class FriendsQuotes < ActiveRecord::Base
    
    @@all = []

    attr_accessor :character, :quote

    def initialize(character, quote)
        @character = character
        @quote = quote
        save 
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end




end