class CreateGithubRepositories < ActiveRecord::Migration[5.0]
  def change
    create_table :github_repositories do |t|
      t.string :full_name

      t.timestamps
    end
  end
end
