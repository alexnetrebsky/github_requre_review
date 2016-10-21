class CreateTesters < ActiveRecord::Migration[5.0]
  def change
    create_table :testers do |t|
      t.string :type
      t.integer :github_repository_id, null: false
      t.string :description
      t.integer :number_approves
      t.string :title_regexp

      t.timestamps
    end

    add_foreign_key :testers, :github_repositories

    add_column :test_result_items, :tester_id, :integer, null: false
    add_foreign_key :test_result_items, :testers
  end
end
