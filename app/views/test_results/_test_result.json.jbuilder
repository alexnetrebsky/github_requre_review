json.extract! test_result, :id, :status, :github_branch, :gihub_pull_request, :created_at, :updated_at
json.url test_result_url(test_result, format: :json)