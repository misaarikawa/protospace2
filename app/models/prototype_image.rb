class PrototypeImage < ActiveRecord::Base
	belongs_to :user
	belongs_to :prototype

	mount_uploader :content, ImageUploader
end
