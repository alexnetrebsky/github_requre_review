class DashboardGithubBranchPresenter < SimpleDelegator
  attr_reader :result

  def initialize(github_branch)
    @result = github_branch.test_results.sort_by(&:created_at).last
    super(github_branch)
  end
end