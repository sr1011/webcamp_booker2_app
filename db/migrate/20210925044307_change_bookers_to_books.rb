class ChangeBookersToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_table :bookers, :books
  end
end
