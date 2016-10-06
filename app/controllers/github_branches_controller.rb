class GithubBranchesController < ApplicationController
  before_action :set_github_branch, only: [:show, :edit, :update, :destroy]

  # GET /github_branches
  # GET /github_branches.json
  def index
    @github_branches = GithubBranch.all
  end

  # GET /github_branches/1
  # GET /github_branches/1.json
  def show
  end

  # GET /github_branches/new
  def new
    @github_branch = GithubBranch.new
  end

  # GET /github_branches/1/edit
  def edit
  end

  # POST /github_branches
  # POST /github_branches.json
  def create
    @github_branch = GithubBranch.new(github_branch_params)

    respond_to do |format|
      if @github_branch.save
        format.html { redirect_to @github_branch, notice: 'Github branch was successfully created.' }
        format.json { render :show, status: :created, location: @github_branch }
      else
        format.html { render :new }
        format.json { render json: @github_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /github_branches/1
  # PATCH/PUT /github_branches/1.json
  def update
    respond_to do |format|
      if @github_branch.update(github_branch_params)
        format.html { redirect_to @github_branch, notice: 'Github branch was successfully updated.' }
        format.json { render :show, status: :ok, location: @github_branch }
      else
        format.html { render :edit }
        format.json { render json: @github_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /github_branches/1
  # DELETE /github_branches/1.json
  def destroy
    @github_branch.destroy
    respond_to do |format|
      format.html { redirect_to github_branches_url, notice: 'Github branch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_github_branch
      @github_branch = GithubBranch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def github_branch_params
      params.require(:github_branch).permit(:name, :github_repository)
    end
end
