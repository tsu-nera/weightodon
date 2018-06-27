class ChangeDateToWeight < ActiveRecord::Migration[5.2]
  def change
    change_column :weights, :date, :datetime
  end
end
