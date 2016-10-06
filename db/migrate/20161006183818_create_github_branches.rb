class CreateGithubBranches < ActiveRecord::Migration[5.0]
  def change
    create_table :github_branches do |t|
      t.string :name
      t.integer :github_repository_id

      t.timestamps
    end

    add_foreign_key :github_branches, :github_repositories, delete: :cascade
  end
end
