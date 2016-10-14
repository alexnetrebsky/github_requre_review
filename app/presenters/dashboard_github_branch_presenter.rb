class DashboardGithubBranchPresenter < SimpleDelegator
  attr_reader :status

  def initialize(github_branch)
    @status = github_branch.test_results.sort_by(&:created_at).last.try(:status) || :null
    super(github_branch)
  end
end