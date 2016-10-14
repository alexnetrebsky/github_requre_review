class UrlBuilder

  def initialize
    @domain = ENV['DOMAIN']
  end

  def test_result_url(test_result_id)
    "#{@domain}/test_results/#{test_result_id}/dashboard"
  end
end