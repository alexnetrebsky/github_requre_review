class Account < ApplicationRecord
  has_many :github_repositories
end
