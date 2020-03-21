class AddIndexesToTests < ActiveRecord::Migration[5.2]
  def change
    add_index :tests, :author_id
    add_index :tests, %i[title level], unique: true
  end
end
