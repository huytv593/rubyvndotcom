class Post < ActiveRecord::Base
  mount_uploader :featured_image, FileUploader
  belongs_to :user
  belongs_to :category
  has_many  :comments

end
