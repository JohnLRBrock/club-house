class RemoveAdminActivatedResetdigestResetsenat < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :admin
    remove_column :users, :activated
    remove_column :users, :reset_digest
    remove_column :users, :reset_sent_at
  end
end
