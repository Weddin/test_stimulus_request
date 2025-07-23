class CreateFoos < ActiveRecord::Migration[7.0]
  def change
    create_table :foos do |t|
      t.string :name, null: false
      t.time :time
      t.boolean :checked, default: false
      t.decimal :price, default: 0.0
      t.string :status, default: "new", null: false

      t.timestamps
    end
  end
end
