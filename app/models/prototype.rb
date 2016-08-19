class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many   :prototype_images
  accepts_nested_attributes_for :prototype_images, reject_if: lambda { |attributes| attributes['content'].blank? }, allow_destroy: true

  validates :title, :catch_copy, :concept, presence: true

end
