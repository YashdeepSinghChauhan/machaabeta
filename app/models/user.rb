class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]
         has_many :posts
         has_many :reviews 
   validates_uniqueness_of :username
   validates :myself, length: { maximum: 100}
   has_attached_file :avatar, styles: { medium: "300x300>", thumb: "50x100>" }, default_url: "/images/:style/missing.png" , :convert_options => { :all => "-quality 75" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
