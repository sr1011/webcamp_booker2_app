class RemoveBookNameFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :book_name, :string
  end
end
