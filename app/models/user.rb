class User < ApplicationRecord
    include ActiveModel::Validations


  # Include default devise modules. Others available are:
  #:omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable, :lockable, :timeoutable, :trackable

  validates :first_name, presence: true,blank: false;
  validates :last_name, presence: true,blank: false;
  validates :username, presence: true,blank: false,uniqueness: true;
  validates :age,presence: true;
  validates :email,presence: true,uniqueness: true;

  has_one_attached :image;

  validates :image, file_content_type: { allow: ['image/jpeg', 'image/gif', 'image/png', 'image/jpg'],
                                        message: 'only %{types} are allowed' }, file_size: { less_than: 10.megabytes,
                                message: 'image should be less than %{count}' }

  has_many :tweets, dependent: :destroy;
 
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users


 


end
