class CreatePokes < ActiveRecord::Migration
  def change
    create_table :pokes do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :ip

      t.timestamps
    end
  end
end
