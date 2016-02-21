class Mentorship < ActiveRecord::Base
  belongs_to :hacker
  belongs_to :student
  belongs_to :language
end
