class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many   :likes, dependent: :destroy  
  has_many   :comments, dependent: :delete_all
  has_many   :prototype_images, dependent: :delete_all
  accepts_nested_attributes_for :prototype_images, reject_if: lambda { |attributes| attributes['content'].blank? }, allow_destroy: true

  validates :title, 
  :catch_copy, 
  :concept, 
  presence: true

  def like_by?(user)
   likes.find_by(user_id: user)
  end

  MAXMUN_IMAGE_NUM = 3
  def set_sub_thumbnails
    sub_images = prototype_images.sub
    MAXMUN_IMAGE_NUM.times { |i| sub_images[i] ||= prototype_images.build(status: "sub") }
      sub_images
  end

  acts_as_taggable_on :tags
  acts_as_taggable
end
