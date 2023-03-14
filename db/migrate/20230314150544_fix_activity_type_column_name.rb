class FixActivityTypeColumnName < ActiveRecord::Migration[7.0]
  def up
    rename_column :activities, :type, :category
  end

  def down
    rename_column :activities, :category, :type
  end
end
