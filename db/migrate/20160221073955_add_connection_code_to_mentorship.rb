class AddConnectionCodeToMentorship < ActiveRecord::Migration
  def change
    add_column :mentorships, :connection_code, :string
  end
end
