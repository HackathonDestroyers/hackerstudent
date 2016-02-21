class Mentorship < ActiveRecord::Base
  belongs_to :hacker
  belongs_to :student
end
