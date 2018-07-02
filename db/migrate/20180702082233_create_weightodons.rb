class CreateWeightodons < ActiveRecord::Migration[5.2]
  def change
    create_table :weightodons do |t|
      t.string :access_token
      t.string :client_id
      t.string :client_secret
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
