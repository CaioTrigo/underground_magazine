class ChangeTableComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :post_id, :integer
    add_reference :comments, :post, foreign_key: true
    add_reference :comments, :user, foreign_key: true
  end
end
