class Post < ApplicationRecord
	validates :image, presence: true

	has_attached_file :image, styles: {:medium => "640x"}
# the line of code above resizes the image to 640px wide
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

post = Post.first
end
