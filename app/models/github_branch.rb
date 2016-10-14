class GithubBranch < ApplicationRecord
  belongs_to :github_repository
  has_many :test_results
end
