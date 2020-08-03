class ChangeDataColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :provider, :text
    change_column :users, :uid, :text
    change_column :users, :token, :text
    change_column :users, :meta, :text
  end
end
