class ChangeColumnToWeight < ActiveRecord::Migration[5.2]
  def change
    change_column :weights, :value, :float
  end
end
