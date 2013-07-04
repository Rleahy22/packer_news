class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :picture
      t.string :password_hash
    end
  end
end
