class CreateUser < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :uid, null: false
      t.string :provider, null: false
      t.string :email

      t.timestamps
    end
  end
end
