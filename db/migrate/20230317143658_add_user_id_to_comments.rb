class AddUserIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user, foreign_key: true, allow_null: false
  end
end
