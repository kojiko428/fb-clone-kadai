class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.string :name
      t.text :email

      t.timestamps
    end
  end
end
