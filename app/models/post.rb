class Post < ApplicationRecord
	searchkick
	belongs_to :user
	has_many :reviews
	has_many :images
	  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png", :convert_options => { :all => "-quality 75" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :description, length: { minimum: 240 }
  validates :title,  uniqueness: { case_sensitive: false}
end
