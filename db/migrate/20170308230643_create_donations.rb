class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donors do |t|
      t.string :email
      t.string :name
      t.string :blood_type, null: false

      t.timestamps
    end

    create_table :recipients do |t|
      t.string :email
      t.string :name
      t.string :blood_type, null: false

      t.timestamps
    end

    create_table :transactions do |t|
      t.references :donor, foreign_key: true, index: true
      t.references :recipient, foreign_key: true, index: true

      t.timestamps
    end
  end
end
