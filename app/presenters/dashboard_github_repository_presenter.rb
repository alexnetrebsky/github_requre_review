class DashboardGithubRepositoryPresenter < SimpleDelegator
  attr_reader :github_branches

  def initialize(github_repository)
    @github_branches = github_repository.github_branches.map { |branch| DashboardGithubBranchPresenter.new(branch)}
    super(github_repository)
  end
end