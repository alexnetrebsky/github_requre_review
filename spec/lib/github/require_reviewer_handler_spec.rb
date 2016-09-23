require 'rails/all'
require 'github_event_handler/handlers/require_reviewer_handler'
require 'github/github_client'


describe RequireReviewerHandler do
  let(:event) { instance_spy('IssueCommentEvent') }
  let!(:client) { instance_double('GithubClient',
                                  pull_request_commits: [{'sha' => 'sha1'}],
                                  create_status: []) }

  before do
    allow(GithubClient).to receive(:new).and_return(client)
  end

  def set_comment(message)
    allow(client).to receive(:issue_comments).and_return([{'body' => message}])
  end

  it 'sends failure status if there is not an appropriate comment' do
    set_comment('not_approprite')

    RequireReviewerHandler.new.handle(event)
    expect(client).to have_received(:create_status).with(anything, 'sha1', 'failure', any_args)
  end

  it 'sends success status if there is an appropriate comment' do
    set_comment([128077].pack('*U'))

    RequireReviewerHandler.new.handle(event)
    expect(client).to have_received(:create_status).with(anything, 'sha1', 'success', any_args)
  end
end