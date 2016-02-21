class AddNameIndexToLanguages < ActiveRecord::Migration
  def change
    add_index :languages, :name
  end
end
