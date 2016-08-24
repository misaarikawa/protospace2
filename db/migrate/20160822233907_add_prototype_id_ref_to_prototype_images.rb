class AddPrototypeIdRefToPrototypeImages < ActiveRecord::Migration
  def change
    add_reference :prototype_images, :prototype_id, index: true
  end
end
