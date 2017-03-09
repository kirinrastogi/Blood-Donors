class CreateDonors < ActiveRecord::Migration[5.0]
  def change
    create_table :donors do |t|
      t.string :name
      t.string :email
      t.string :blood_type

      t.timestamps
    end
  end
end
