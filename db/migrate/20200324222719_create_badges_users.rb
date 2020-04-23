class CreateBadgesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :badges_users do |t|
      t.references :badge, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
