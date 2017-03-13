require 'test_helper'

class DonationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @controller = DonationsController.new
  end

  teardown do
    Rails.cache.clear
  end

  test 'what is passed' do
    @controller.send(:show_json, 2)
  end
end
