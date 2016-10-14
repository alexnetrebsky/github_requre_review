class Account < ApplicationRecord
  has_many :github_repositories
  has_many :users
end
