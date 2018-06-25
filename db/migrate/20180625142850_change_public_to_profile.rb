class ChangePublicToProfile < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :birth, :timestamp
    add_column :profiles, :age, :integer
    change_column :profiles, :public, :string
  end
end
