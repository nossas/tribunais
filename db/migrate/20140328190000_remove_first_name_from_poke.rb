class RemoveFirstNameFromPoke < ActiveRecord::Migration
  def change
    remove_column :pokes, :first_name, :string
  end
end
