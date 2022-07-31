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
        puts "brilliant, #{name}. Would you like to check out some quotes?"
        puts "Input 'y' to see the the beloved characters, 'exit' to leave the application!"
    end
# based on user selection list of characters, error message and exit

    def menu
        selection = user_input

        if select == 'y'

        elsif selection =='exit'

        else
            puts "invalid"
        end

    end



end