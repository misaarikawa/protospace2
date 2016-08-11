class PrototypeImage < ActiveRecord::Base
	belongs_to :user
	belongs_to :prototype

	enum status: {main: 10, sub: 20}

	validates :content, presence: true

	mount_uploader :content, PrototypeContentUploader
end
