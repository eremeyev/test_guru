class CreateBadgesRules < ActiveRecord::Migration[5.2]
  def change
    create_table :badges_rules do |t|
      t.references :badge, foreign_key: true
      t.references :rule, foreign_key: true
    end
  end
end
