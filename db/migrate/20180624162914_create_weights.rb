class CreateWeights < ActiveRecord::Migration[5.2]
  def change
    create_table :weights do |t|
      t.integer :value
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
