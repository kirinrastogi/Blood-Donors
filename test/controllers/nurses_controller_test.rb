require 'test_helper'

class NursesControllerTest < ActionDispatch::IntegrationTest
  test 'get index response' do
    get nurses_url
    assert_response :ok
  end

  test 'get index response format' do
    get nurses_url
    body = JSON.parse @response.body
    assert_equal 'application/json', @response.content_type
    assert_kind_of Array, body
    assert_kind_of Hash, body[0]
  end

  test 'get index response properties' do
    get nurses_url
    nurse = JSON.parse(@response.body).first
    id, name, email = nurse.values
    assert_equal 'nurseName2', name
    assert_equal 'nurseEmail2@email.com', email
    assert_equal 2, id
    assert Nurse.new(nurse).validate
  end

  test 'get show response' do
    get nurses_url + '1/'
    assert_response :ok
    assert_equal 'text/html', @response.content_type
    assert_kind_of String, @response.body
  end

  test 'get show response format' do
    get nurses_url + '2/'
    nurse = @controller.send(:show_json)
    assert_kind_of Hash, nurse
  end

  test 'get show response properties' do
    get nurses_url + '2/'
    nurse = @controller.send(:show_json)
    id, name, email = nurse.values
    assert_equal 'nurseName2', name
    assert_equal 2, id
    assert_equal 'nurseEmail2@email.com', email
    assert Nurse.new(nurse).validate
  end
end
