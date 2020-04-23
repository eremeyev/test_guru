class ChangeBadgesConditionToArgs < ActiveRecord::Migration[5.2]
  def change
    rename_column :badges, :condition, :args
  end
end
