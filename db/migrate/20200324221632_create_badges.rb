class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :image
      t.string :color
      t.string :method
      t.string :args

      t.timestamps
    end
  end
end
