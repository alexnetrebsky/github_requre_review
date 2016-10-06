json.extract! github_branch, :id, :name, :github_repository, :created_at, :updated_at
json.url github_branch_url(github_branch, format: :json)