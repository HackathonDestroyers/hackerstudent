class Language < ActiveRecord::Base
  has_many :hacker_languages
  has_many :hackers, through: :hacker_languages
end
