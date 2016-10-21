class Tester < ApplicationRecord
  belongs_to :github_repository

  def filled_description
    self.description
  end
end
