class CreateHardwaretypes < ActiveRecord::Migration
  def change
    create_table :hardwaretypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
