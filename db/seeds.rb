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
test_result = TestResult.create(status: :failed, github_branch: branch, github_pull_request: 1)
TestResultItem.create(status: :failed, description: 'There is no task number on the title', test_result: test_result)
TestResultItem.create(status: :success, description: nil, test_result: test_result)

