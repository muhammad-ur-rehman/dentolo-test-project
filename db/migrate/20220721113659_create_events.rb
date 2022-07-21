class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.date :time, null: false
      t.text :sub_events
      t.integer :web_source, null: false

      t.timestamps
    end
  end
end
