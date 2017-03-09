class CreatePresentNurses < ActiveRecord::Migration[5.0]
  def change
    create_table :present_nurses do |t|
      t.references :donation, foreign_key: true
      t.references :nurse, foreign_key: true

      t.timestamps
    end
  end
end
