class Quotes < ActiveRecord::Migration[5.1]

    def change
        create_table :quotes do |t|
            t.string :quote
            t.integer :character_id
        end
    end
end