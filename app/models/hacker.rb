class Hacker < ActiveRecord::Base
  has_many :mentorships
  has_many :students, through: :mentorships
  has_many :hacker_languages, dependent: :destroy
  has_many :languages, through: :hacker_languages
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
