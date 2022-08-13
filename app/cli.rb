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
        menu
    end

    def menu
        puts "Please input 'y' to select the beloved character, 'q' to leave the application!"
        selection = user_input

        if selection == 'y'
            friends_list
        elsif selection == 'q'
            bye
            menu2
        else
            invalid
        end
    end

    def bye
        puts "Hold on!"
        puts "********"
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
        puts "Select a Friend to get a quote! (use its number)"

        selection = user_input
        if Character.exists?(id: selection)
            quotation = Quote.where(character_id: selection)
            quotation_random = quotation.shuffle.first
            quote_detail(quotation_random)
        else
            puts "Input seems invalid. Can you please try again?"
            friends_selection
        end
    end

    def quote_detail(quotation_random)
        puts "-----------------------------------------------------------------"
        puts "Quote: #{quotation_random.quote}"
        puts "Character: #{Character.find(quotation_random.character_id).name}"
        puts "------------------------------------------------------------------"
        menu
    end

    def menu2
        puts "Before I let you go, can you tell us your favorite character and respective quote?" 
        puts "Please input 'y' to yes, or 'exit' to leave the application for good!"

        selection = user_input

        if selection == 'y'
            puts "Please input Character:"
            selection = user_input
            users_fav_character = add_character(selection)
            puts "Please input Quote:"
            selection = user_input
            add_quote(selection, users_fav_character)
            puts "Your favorite Character and Quote has been saved on our database!"
            by_for_now
        else selection == 'exit'
            by_for_now
        end
    end

    def add_character(selection)
        Character.find_or_create_by(name: selection)
    end

    def add_quote(selection, users_fav_character)
        Quote.find_or_create_by(quote: selection, character_id: users_fav_character.id)
    end

    def by_for_now
        puts "^^^^^^^^^^^^^^^^^^^^^"
        puts "Thanks for playing!!!"
        puts "^^^^^^^^^^^^^^^^^^^^^"
        exit!
    end

end