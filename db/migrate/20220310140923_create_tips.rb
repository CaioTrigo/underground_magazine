class CreateTips < ActiveRecord::Migration[6.1]
  def change
    create_table :tips do |t|
      t.references :user, null: false, foreign_key: true
      t.float :value
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
