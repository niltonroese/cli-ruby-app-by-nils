class Service

    def manipulate_data
        data = API2.get_data
        character_list = data.map do |quote|
          quote['character']
        end.uniq
        character_list.each do |character|
        Characters.create(character: character['character'])
        end
        data.each do |quote|
            Quotes.create(quote: quote['quote'], character_id: Character.find_by_name(quote['character']))
        end
    end
end