class ChangeAdminType < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :admin, :string
  end
end
