require 'github_event_handler/handlers/require_reviewer_handler'

describe RequireReviewerHandler do

  it 'should do something' do
    payload = {
        'issue' => {'number' => 7},
        'repository' => {'full_name' => 'user_name/repo'}
    }
    event = IssueCommentEvent.try_parse({'X-GitHub-Event' => 'issue_comment'}, payload)

    result = RequireReviewerHandler.handle(event)
  end
end