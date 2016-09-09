class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, index: true, foreign_key: true
      t.integer :prototype_id, index: true, foreign_key: true
      t.text    :article

      t.timestamps null: false
    end
  end
end
