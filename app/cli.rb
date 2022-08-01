class CLI
    # def initialize
    #     puts "welcome to the application Quotes from Friends"
    # end
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
        puts "Input 'y' to see the the beloved characters, 'q' to leave the application!"
        menu
    end

    def friends_list
        ["Ross", "Joey", "Chandler", "Monica", "Phoebe", "Rachel"].each.with_index(1) do |friends, i|
            puts "#{i}. #{friends}"
        end
    end

    def bye
        puts "Bye for now!"
    end

    def invalid
        puts "Input seems invalid. Can you please try again?"
        menu
    end

        # based on user selection list of characters, error message and exit

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