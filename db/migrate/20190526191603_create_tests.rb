class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.string :level, null: false, default: 'simple'
      t.references :category, foreign_key: true, null: false
      t.integer :author_id

      t.timestamps
    end
  end
end
