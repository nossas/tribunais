class RemoveEmailFromPoke < ActiveRecord::Migration
  def change
    remove_column :pokes, :email, :string
  end
end
