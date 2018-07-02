class AddColumnToWeightodon < ActiveRecord::Migration[5.2]
  def change
    add_column :weightodons, :username, :string
    add_column :weightodons, :password, :string
  end
end
