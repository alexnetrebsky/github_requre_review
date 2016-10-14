# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
account = Account.create(name: 'anetrebsky')
GithubRepository.create(full_name: 'alexnetrebsky/test_git', account: account)
user = User.create(
               email: 'alex@mail.ru',
               password: 'p@ssw0rd',
               password_confirmation: 'p@ssw0rd',
               account: account
)