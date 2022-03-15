class AddUsersToChatrooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :chatrooms, :first_user, null: false, foreign_key: { to_table: :users}, index: true
    add_reference :chatrooms, :second_user, null: false, foreign_key: { to_table: :users}, index: true
  end
end
