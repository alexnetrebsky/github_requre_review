require 'rails/all'
require 'rspec'
require 'github_event_handler/handlers/base_handler'
require 'github_event_handler/github_event_handler'
require 'github_event_handler/handlers/require_reviewer_handler'

describe GithubEventHandler do

  it 'invokes handling' do
    event = class_spy('IssueCommentEvent')
    allow(RequireReviewerHandler).to receive(:events).and_return([event])
    allow(BaseHandler).to receive(:handle)

    request = instance_double('Require',
                    headers: {'X-GitHub-Event' => 'issue_comment'},
                    body: double(read: '{}')
    )



    GithubEventHandler.new.handle(request)

    expect(BaseHandler).to have_received(:handle)
  end
end