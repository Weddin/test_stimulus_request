class CreateBars < ActiveRecord::Migration[7.0]
  def change
    create_table :bars do |t|
      t.references :foo, null: false, foreign_key: true
      t.string :name, null: false
      t.string :descriptions

      t.timestamps
    end
  end
end
