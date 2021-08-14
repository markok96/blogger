class SorceryCore < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :username,         null: false
      t.string :email,            null: false
      t.string :crypted_password
      t.string :salt
      t.references :authors null: false, foreign_key: true

      t.timestamps                null: false
    end

    add_index :authors, :email, unique: true
  end
end
