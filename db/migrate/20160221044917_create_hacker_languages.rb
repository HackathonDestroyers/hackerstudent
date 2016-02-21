class CreateHackerLanguages < ActiveRecord::Migration
  def change
    create_table :hacker_languages do |t|
      t.belongs_to :hacker, index: true, foreign_key: true
      t.belongs_to :language, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
