class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.references :property, null: false, foreign_key: true
      t.string :name
      t.string :kind

      t.timestamps
    end
  end
end
