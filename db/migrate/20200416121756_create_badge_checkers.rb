class CreateBadgeCheckers < ActiveRecord::Migration[5.2]
  def change
    create_table :badge_checkers do |t|
      t.integer :user_id
      t.integer :badge_id

      t.timestamps
    end
  end
end
