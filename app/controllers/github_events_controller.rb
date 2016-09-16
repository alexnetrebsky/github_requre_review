class GithubEventsController < ApplicationController
  def index
    @items = GithubEvent.all
  end
end
