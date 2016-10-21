module PullRequestTesters
  class ApproveExistenceTester
    THUMBS_UP_SIGN_CODE = 128077

    def initialize(tester)
      @number_required_approves = tester.number_approves
      @description = tester.description
    end

    def test(pull_request, client = nil)
      pull_request_number = pull_request.fetch(:number.to_s)
      repository_full_name = pull_request['head']['repo']['full_name']

      comments = client.issue_comments repository_full_name, pull_request_number

      number_approves = comments.select { |comment| comment[:body.to_s].unpack('U*').include?(THUMBS_UP_SIGN_CODE) }.count

      if number_approves < @number_required_approves
        return @description % {number: @number_required_approves - number_approves}
      end

      nil
    end
  end
end
