class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :prototype_id
      t.text    :article

      t.timestamps null: false
    end
  end
end
