class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :type
      t.integer :participants
      t.decimal :price
      t.string :link
      t.integer :key
      t.decimal :accessibility

      t.timestamps
    end
  end
end
