class CreateBookers < ActiveRecord::Migration[5.2]
  def change
    create_table :bookers do |t|
      t.text :book_name
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
