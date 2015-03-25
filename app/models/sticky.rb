class Sticky < ActiveRecord::Base

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	# validates :image, :attachment_presence => true
	# validates_with AttachmentPresenceValidator, :attributes => :image
	# validates_with AttachmentSizeValidator, :attributes => :image, :less_than => 3.megabytes

	belongs_to :user
	has_many :helps

	# this is a comment so I can push to heroku

end