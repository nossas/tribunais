class RemoveLastNameFromPoke < ActiveRecord::Migration
  def change
    remove_column :pokes, :last_name, :string
  end
end
