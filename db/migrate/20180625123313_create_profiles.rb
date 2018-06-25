class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :nicname
      t.boolean :public
      t.float :height
      t.float :start_weight
      t.string :sex
      t.timestamp :birth
      t.string :message
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
