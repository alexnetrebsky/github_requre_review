class RequireApproveTester < Tester
  def filled_description
    self.description % {number: number_approves}
  end
end
