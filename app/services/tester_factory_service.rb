require 'github_event_handler/handlers/pull_request_testers/approve_existence_tester'
require 'github_event_handler/handlers/pull_request_testers/title_tester'

class TesterFactoryService
  def create(tester)
    case tester
      when TitleFormatTester
        return PullRequestTesters::TitleTester.new(tester)
      when RequireApproveTester
        return PullRequestTesters::ApproveExistenceTester.new(tester)
    end

  end
end