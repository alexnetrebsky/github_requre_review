class CreateGithubEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :github_events do |t|
      t.string :payload

      t.timestamps
    end
  end
end
