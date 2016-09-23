module PullRequestTesters
  class ApproveExistenceTester
    THUMBS_UP_SIGN_CODE = 128077
    NUMBER_REQUIRED_APPROVES = 2

    def test(pull_request, client = nil)
      pull_request_number = pull_request.fetch(:number.to_s)
      repository_full_name = pull_request['head']['repo']['full_name']

      comments = client.issue_comments repository_full_name, pull_request_number

      number_approves = comments.select { |comment| comment[:body.to_s].unpack('U*').include?(THUMBS_UP_SIGN_CODE) }.count

      if number_approves < NUMBER_REQUIRED_APPROVES
        if (NUMBER_REQUIRED_APPROVES - number_approves > 1)
          return "#{NUMBER_REQUIRED_APPROVES - number_approves} approves are required"
        else
          return "#{NUMBER_REQUIRED_APPROVES - number_approves} approve is required"
        end
      end

      nil
    end
  end
end
