class PrototypeImage < ActiveRecord::Base
	belongs_to :user
	belongs_to :prototype

	validates_attachment_content_type :content,
                                      content_type: ["image/jpg","image/jpeg","image/png"]

	mount_uploader :content, PrototypeImageUploader
end
