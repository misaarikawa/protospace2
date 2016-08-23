class PrototypeImage < ActiveRecord::Base
	belongs_to :user
	belongs_to :prototype

	enum status: {main: 1, sub: 2}

	validates (:content || :main), presence: true

	mount_uploader :content, PrototypeContentUploader
end
