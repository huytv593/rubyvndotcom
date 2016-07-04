class Category < ActiveRecord::Base
  mount_uploader :featured_image, FileUploader
  has_many :posts
end
