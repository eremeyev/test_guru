class AddColorToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :color, :string
  end
end
