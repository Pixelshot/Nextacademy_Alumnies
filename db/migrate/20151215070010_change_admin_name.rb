class ChangeAdminName < ActiveRecord::Migration
  def change
    rename_column :users, :admin, :role
  end
end
