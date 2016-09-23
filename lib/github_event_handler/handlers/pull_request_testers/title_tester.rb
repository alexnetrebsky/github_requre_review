module PullRequestTesters
  class TitleTester
    def test(pull_request, client = nil)
      pull_request_title = pull_request['title']
      'title should has number of the task, eg. SPH-1000' unless pull_request_title.match(/SPH-\d{4}/)
    end
  end
end