class AddConditionToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :condition, :string
  end
end
