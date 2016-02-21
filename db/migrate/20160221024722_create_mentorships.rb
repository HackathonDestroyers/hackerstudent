class CreateMentorships < ActiveRecord::Migration
  def change
    create_table :mentorships do |t|
      t.belongs_to :hacker, index: true, foreign_key: true
      t.belongs_to :student, index: true, foreign_key: true
      t.datetime :started_at
      t.datetime :ended_at
      t.integer :hacker_rating
      t.integer :student_rating
      t.text :comment

      t.timestamps null: false
    end
  end
end
