class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.references :donor, foreign_key: true, null: false
      t.references :recipient, foreign_key: true, null: false

      t.timestamps
    end
  end
end
