class Iteration_database

    def manipulate_data
        data = API.get_data
        # puts data
        character_list = data.map do |quote|
          quote['character']
        end.uniq      
        character_list.each do |character|
            # puts character
            Character.where(name: character).first_or_create
        end
        data.each do |quote|
            Quote.where(quote: quote['quote'], character_id: Character.find_by_name(quote['character']).id).first_or_create
            # puts Character.find_by_name(quote['character']).id
        end
    end
end