class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.boolean :wetsuit, default: :false
      t.boolean :flippers, default: :false
      t.boolean :mask, default: :false
      t.boolean :book_of_myths, default: :false
      t.boolean :camera, default: :false
      t.boolean :film, default: :false
      t.boolean :knife, default: :false
      t.boolean :ready, default: :false

      t.timestamps
    end
  end
end
