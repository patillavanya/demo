class CreateInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :instruments do |t|
      t.string :brand
      t.decimal :price
      t.string :Title

      t.timestamps
    end
  end
end
