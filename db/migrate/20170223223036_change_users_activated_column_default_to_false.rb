class ChangeUsersActivatedColumnDefaultToFalse < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :activated, :boolean, default: false
  end
end
