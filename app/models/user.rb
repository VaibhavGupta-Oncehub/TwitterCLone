class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #:omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable, :lockable, :timeoutable, :trackable

  validates :first_name, presence: true,blank: false;
  validates :last_name, presence: true,blank: false;
  validates :username, presence: true,blank: false,uniqueness: true;
  validates :age,presence: true;
  validates :email,presence: true,uniqueness: true;


end
