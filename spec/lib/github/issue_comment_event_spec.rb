require 'github_event_handler/events/issue_comment_event'

describe IssueCommentEvent do
  describe '.try_parse' do
    it 'returns not nil' do
      result = IssueCommentEvent.try_parse({'X-GitHub-Event' => 'issue_comment'}, {a: ''})
      expect(result).not_to be_nil
      expect(result).to be_a(IssueCommentEvent)
    end
  end
end