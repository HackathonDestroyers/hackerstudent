class HackerLanguage < ActiveRecord::Base
  belongs_to :hacker
  belongs_to :language
end
