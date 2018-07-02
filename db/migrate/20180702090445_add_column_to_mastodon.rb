class AddColumnToMastodon < ActiveRecord::Migration[5.2]
  def change
    add_column :mastodons, :username, :string
    add_column :mastodons, :password, :string
  end
end
