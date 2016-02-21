class AddLanguagesKeyToMentorship < ActiveRecord::Migration
  def change
    add_reference :mentorships, :language, index: true, foreign_key: true
  end
end
