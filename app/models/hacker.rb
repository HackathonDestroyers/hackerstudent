class Hacker < ActiveRecord::Base
  has_many :mentorships
  has_many :students, through: :mentorships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
