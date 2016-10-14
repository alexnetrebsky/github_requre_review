class GithubRepositoryController < ApplicationController
  before_action :set_github_repository, only: [:dashboard]

  def dashboard
    @repository = DashboardGithubRepositoryPresenter.new @repository
  end

  private

  def set_github_repository
    @repository = GithubRepository.find(params[:id])
  end
end
