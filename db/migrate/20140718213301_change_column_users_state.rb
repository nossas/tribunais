class ChangeColumnUsersState < ActiveRecord::Migration
  def up
    change_column :users, :state, :string
  end

  def down
    change_column :users, :state, :string
  end
end
