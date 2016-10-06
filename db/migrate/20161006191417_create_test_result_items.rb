class CreateTestResultItems < ActiveRecord::Migration[5.0]
  def change
    create_table :test_result_items do |t|
      t.string :status
      t.integer :test_result_id
      t.string :description
      t.string :key

      t.timestamps
    end

    add_foreign_key :test_result_items, :test_results, delete: :cascade
  end
end
