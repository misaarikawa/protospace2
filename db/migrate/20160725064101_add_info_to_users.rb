class AddInfoToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :profile, :text
  	add_column :users, :works, :string
  	add_column :users, :member_of, :string 
  end
end
