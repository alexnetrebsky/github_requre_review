require 'test_helper'
require 'github_event_handler/events/issue_comment_event'

class IssueCommentEventTest < ActiveSupport::TestCase

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
  def test_try_parse
    result = IssueCommentEvent.try_parse({'X-GitHub-Event' => 'issue_comment'}, {a: ''})
    assert result.present?
    assert result.is_a?(IssueCommentEvent)
  end

  def test_try_parse_get_pull_request
    payload = {'issue' => { 'number' => 7 }}
    result = IssueCommentEvent.try_parse({'X-GitHub-Event' => 'issue_comment'}, payload)
    assert result.pull_request_number == 7
  end
end