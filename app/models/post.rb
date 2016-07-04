class Post < ActiveRecord::Base
  mount_uploader :featured_image, FileUploader
  paginates_per 20
  belongs_to :user
  belongs_to :category
  has_many  :comments

end
