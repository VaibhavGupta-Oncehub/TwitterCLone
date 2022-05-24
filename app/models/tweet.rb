class Tweet < ApplicationRecord
 

  validates :title, presence: true,blank: false, null: false,length:{minimum: 0, maximum:100};
  validates :description, presence: true,blank: false, null: false,length:{minimum: 0, maximum:200};
  
  belongs_to :user;

end
