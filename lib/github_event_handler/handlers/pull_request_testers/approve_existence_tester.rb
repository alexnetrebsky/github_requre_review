module PullRequestTesters
  class ApproveExistenceTester
    THUMBS_UP_SIGN_CODE = 128077

    def test(pull_request, client = nil)
      pull_request_number = pull_request.fetch(:number.to_s)
      repository_full_name = pull_request['head']['repo']['full_name']

      comments = client.issue_comments repository_full_name, pull_request_number

      number_approves = comments.select { |comment| comment[:body.to_s].unpack('U*').include?(THUMBS_UP_SIGN_CODE) }.count

      return 'one review required' if number_approves == 0
    end
  end
end
