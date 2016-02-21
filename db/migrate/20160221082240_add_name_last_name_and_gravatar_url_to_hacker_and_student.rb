class AddNameLastNameAndGravatarUrlToHackerAndStudent < ActiveRecord::Migration
  def change
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string
    add_column :students, :gravatar_url, :string

    add_column :hackers, :first_name, :string
    add_column :hackers, :last_name, :string
    add_column :hackers, :gravatar_url, :string
  end
end
