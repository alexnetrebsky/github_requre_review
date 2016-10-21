class TesterRepository

  class << self

    def find_by_repository_full_name(repository_full_name)
      Tester
        .joins(:github_repository)
        .where(github_repositories: {
            full_name: repository_full_name
        })
        .to_a
    end

  end
end