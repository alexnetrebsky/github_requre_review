class TestResult < ApplicationRecord
  belongs_to :github_branch
  has_many :test_result_items
end
