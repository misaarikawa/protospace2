class CreatePrototypeImages < ActiveRecord::Migration
  def change
    create_table :prototype_images do |t|
      t.references :prototype
      t.string  :content
      t.integer :status

      t.timestamps null: false
    end
    add_index :prototype_images, [:prototype_id, :created_at]
  end
end
