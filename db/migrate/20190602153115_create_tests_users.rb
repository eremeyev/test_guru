class CreateTestsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :tests_users do |t|
      t.references :test, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
    end
  end
end
