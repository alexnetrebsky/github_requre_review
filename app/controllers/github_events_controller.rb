class GithubEventsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]

  def index
    @items = GithubEvent.all
  end

  def create
    payload = JSON.parse(request.body.read)
    GithubEvent.create({payload: payload})
    render plain: 'OK'
  end
end
