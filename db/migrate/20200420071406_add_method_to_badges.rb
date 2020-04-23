class AddMethodToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :method, :string
  end
end
