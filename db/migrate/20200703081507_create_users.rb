class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname,           null: false
      t.string :email,              null: false, unique: true, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.timestamps
    end
  end
end
