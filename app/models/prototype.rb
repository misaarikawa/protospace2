class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many   :prototype_images
  accepts_nested_attributes_for :prototype_images, allow_destroy: true

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true

end
