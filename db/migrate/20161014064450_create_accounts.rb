class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :name

      t.timestamps
    end

    add_column :github_repositories, :account_id, :integer, null: false
    add_foreign_key :github_repositories, :accounts
  end
end