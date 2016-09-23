require 'octokit'

class GithubClient < DelegateClass(Octokit::Client)
  def initialize()
    super Octokit::Client.new access_token: ENV['GITHUB_ACCESS_TOKEN']
  end
end