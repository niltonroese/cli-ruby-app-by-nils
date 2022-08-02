class CLI
    # def initialize
    #     puts "welcome to the application Quotes from Friends"
    # end
    def start
        puts "Welcome to the application Friends TV Show Quotes"
        puts "Can I have your name:"
        API.get_data
        greet(user_input)
    end

    def user_input
        gets.strip
    end

    def greet(name)
        puts "Brilliant, #{name}! Would you like to check out some quotes?"
        puts "Please input 'y' to select the beloved character, 'q' to leave the application!"
        menu
    end

    def friends_list
        FriendsQuote.all.each.with_index(1) do |friends, i|
            puts "#{i}. #{friends.character}"
        end
        friends_selection
    end

    def friends_selection
        puts "Select a friend to get a quote!"

        selection = user_input
        quotation = FriendsQuote.find_quote(selection)
        quote_detail(quotation)
    end

    def quote_detail(quotation)
        puts "Quote: #{quotation.quote}"
        puts "Character: #{quotation.character}"
        menu
    end

    def bye
        puts "Bye for now!"
    end

    def invalid
        puts "Input seems invalid. Can you please try again?"
        menu
    end

    def menu
        selection = user_input

        if selection == 'y'
            friends_list
            menu
        elsif selection == 'q'
            bye
        else
            invalid
        end
    end
end