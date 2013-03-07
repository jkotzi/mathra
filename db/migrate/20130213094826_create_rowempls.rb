class CreateRowempls < ActiveRecord::Migration
  def change
    create_table :rowempls do |t|
      t.integer :warehouse_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
