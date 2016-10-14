class CreateTestResults < ActiveRecord::Migration[5.0]
  def change
    create_table :test_results do |t|
      t.string :status
      t.integer :github_branch_id
      t.integer :github_pull_request

      t.timestamps
    end

    add_foreign_key :test_results, :github_branches, delete: :cascade
  end
end
