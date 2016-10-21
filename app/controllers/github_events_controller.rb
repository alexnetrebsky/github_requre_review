require 'github_event_handler/github_event_handler'

class GithubEventsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:create]
  skip_before_filter :verify_authenticity_token, only: [:create]

  def index
    @items = GithubEvent.all
  end

  def create
    payload = JSON.parse(request.body.read)
    GithubEvent.create({payload: payload})
    handler = GithubEventHandler.new
    handled = handler.handle(request)
    render plain: handled ? 'Handled' : 'Not handled'
  end

  def set_status
    client = Octokit::Client.new access_token:''
  end
end
