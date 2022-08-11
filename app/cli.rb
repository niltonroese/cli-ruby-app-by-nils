class CLI
    def initialize
        Iteration_database.new.manipulate_data
    end

    def start
        puts "Welcome to the application Friends TV Show Quotes"
        puts "Can I have your name:"
        greet(user_input)
    end

    def user_input
        gets.strip
    end

    def greet(name)
        puts "Brilliant, #{name}! Would you like to check out some quotes?"
        # puts "Please input 'y' to select the beloved character, 'q' to leave the application!"
        menu
    end

    def menu
        puts "Please input 'y' to select the beloved character, 'q' to leave the application!"
        selection = user_input

        if selection == 'y'
            friends_list
            menu
        elsif selection == 'q'
            bye
            # menu2
        else
            invalid
        end
    end

    def bye
        puts "Bye for now!"
        menu2
    end

    def invalid
        puts "Input seems invalid. Can you please try again?"
        menu
    end

    def friends_list
        Character.all.each do |friend|
            puts "#{friend.id}. #{friend.name}"
        end
        friends_selection
    end

    def friends_selection
        puts "Select a friend to get a quote!"

        selection = user_input
        quotation = Quote.where(character_id: selection)
        quotation_random = quotation.shuffle.first
        quote_detail(quotation_random)
    end

    def quote_detail(quotation_random)
        puts "----------------"
        puts "Quote: #{quotation_random.quote}"
        # puts "Character: #{quotation_random.character_id}"
        puts "----------------"
        menu
    end

    def menu2
        puts "Before I let you go, would you want to tell us your favorite character and respective quote?" 
        puts "Please input 'y' to yes, or 'exit' to leave the application for good!"

        selection = user_input

        if selection == 'y'
            puts "Please input Character."
            selection = user_input
            #function add_character(selection)
            puts "Please input Quote."
            selection = user_input
            #function add_quote(selection)
            thanks4playing
        else selection == 'exit'
            thanks4playing
        end
    end

    # def add_character(selection)
    # Character.where(name: selection).first_or_create
    # end

    # def add_quote(selection)
    # Quote.where(quote: selection, character_id: Character.last.first_or_create
    # end

    def thanks4playing
        puts "^^^^^^^^^^^^^^^^^^^^^"
        puts "Thanks for playing!!!"
        puts "^^^^^^^^^^^^^^^^^^^^^"
        exit!
    end

end