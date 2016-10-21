# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
account = Account.create(name: 'anetrebsky')
user = User.create(
    email: 'alex@mail.ru',
    password: 'p@ssw0rd',
    password_confirmation: 'p@ssw0rd',
    account: account
)

repository = GithubRepository.create(full_name: 'alexnetrebsky/test_git', account: account)
branch = GithubBranch.create(name: 'dev-1', github_repository: repository)

title_tester = TitleFormatTester.create(github_repository: repository, title_regexp: 'SPH-\d{4}', description: 'title should has number of the task, eg. SPH-1000')
require_approves_tester = RequireApproveTester.create(github_repository: repository, number_approves: 2, description: '%{number} approves are required')

test_result = TestResult.create(status: :failed, github_branch: branch, github_pull_request: 1)
TestResultItem.create(status: :failed, tester: title_tester, description: 'There is no task number on the title', test_result: test_result)
TestResultItem.create(status: :success, tester: require_approves_tester, description: nil, test_result: test_result)

