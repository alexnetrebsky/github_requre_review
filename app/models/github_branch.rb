class GithubBranch < ApplicationRecord
  belongs_to :github_repository
  has_one :test_result
end
