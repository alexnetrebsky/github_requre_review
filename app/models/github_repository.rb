class GithubRepository < ApplicationRecord
  has_many :github_branches
  belongs_to :account
end
