class TestResultItem < ApplicationRecord
  belongs_to :test_result
  belongs_to :tester
end
