class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
      t.string :name
      t.string :serial
      t.integer :hardwaretype_id
      t.date :pdate
      t.text :specs
      t.text :apps
      t.text :notes

      t.timestamps
    end
  end
end
