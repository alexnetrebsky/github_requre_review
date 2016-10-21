module PullRequestTesters
  class TitleTester
    def initialize(tester)
      @regexp = tester.title_regexp
      @description = tester.description
    end

    def test(pull_request, client = nil)
      pull_request_title = pull_request['title']
      @description unless pull_request_title.match(@regexp)
    end
  end
end