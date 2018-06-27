class AddDateToWeights < ActiveRecord::Migration[5.2]
  def change
    add_column :weights, :date, :timestamp
  end
end
