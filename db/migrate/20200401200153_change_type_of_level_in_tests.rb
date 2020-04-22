class ChangeTypeOfLevelInTests < ActiveRecord::Migration[5.2]
  def change
    change_column :tests, :level, :string
  end
end
