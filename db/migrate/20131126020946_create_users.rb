class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
        t.string :first_name
        t.string :last_name
        t.string :name
        t.string :email
        t.string :image
        t.string :password_digest
        t.string :remember_token
        t.boolean :admin, default: false

        t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, [:name, :remember_token]
  end
end
