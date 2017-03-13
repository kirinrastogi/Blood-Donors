class CreateDonors < ActiveRecord::Migration[5.0]
  def change
    create_table :donors do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :blood_type, null: false

      t.timestamps
    end
  end
end
