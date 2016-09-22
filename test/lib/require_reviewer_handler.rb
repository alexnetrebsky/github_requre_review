require 'test_helper'
require 'github_event_handler/handlers/require_reviewer_handler'

class RequireReviewerHandlerTest < ActiveSupport::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_handle
    payload = {
        'issue' => {'number' => 7},
        'repository' => {'full_name' => 'user_name/repo'}
    }
    event = IssueCommentEvent.try_parse({'X-GitHub-Event' => 'issue_comment'}, payload)

    result = RequireReviewerHandler.handle(event)
  end
end