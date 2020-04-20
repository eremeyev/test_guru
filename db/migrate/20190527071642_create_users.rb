class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :login
      t.string :password_digest, null: false
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.string :type, null: false, default: 'User'

      t.timestamps
    end
  end
end
