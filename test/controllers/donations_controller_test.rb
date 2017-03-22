require 'test_helper'

class DonationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @controller = DonationsController.new
  end

  teardown do
    Rails.cache.clear
  end

  def validate_ids(array, id, id_name)
    array.each do |patient|
      assert_equal id, patient[id_name]
    end
  end

  test 'should be ok response on donations index' do
    get donations_url
    assert_response :ok
  end

  test 'should be ok format for index response' do
    get donors_url
    body = JSON.parse @response.body
    assert_equal 'application/json', @response.content_type
    assert_kind_of Array, body
    assert_kind_of Hash, body[0]
  end

  test 'should be ok for index properties' do
    get donations_url
    donation = JSON.parse(@response.body).first
    id, donor_id, recipient_id = donation.values
    assert_equal 1, id
    assert_equal 1, donor_id
    assert_equal 2, recipient_id
    assert Donation.new(donation).validate
  end

  test 'should be ok response on donations show' do
    get donations_url + '1/'
    assert_response :ok
    assert_equal 'text/html', @response.content_type
    assert_kind_of String, @response.body
  end

  test 'should give response when showing data' do
    donation = @controller.send :show_json, 1
    # temporary, uses Donor.select in controller
    assert_kind_of Donor, donation
  end

  test 'should have right format for show response properties' do
    get donations_url + '2/'
    donation = @controller.send :show_json, 1
    id, created_at, recipient_id, donor_id, recipient_name, recipient_email, donor_name, donor_email = donation.attributes.values
    assert_equal 1, id
    assert_equal 2, recipient_id
    assert_equal 'recName2', recipient_name
    assert_equal 'recEmail2@email.com', recipient_email
    assert_equal 'donName1', donor_name
    assert_equal 'donEmail1@email.com', donor_email
    assert_raises ActiveRecord::UnknownAttributeError do
      Donation.new(donation.attributes).validate
    end
    assert Donation.new({ id: id, donor_id: donor_id, recipient_id: recipient_id }).validate
  end

  test 'should have donors to do with a donation' do
    id = 1
    get donations_url + "donor/#{id}"
    donors = @controller.send :donor_json, id
    validate_ids donors, id, :donor_id
    assert_equal 2, donors.length
    assert_kind_of ActiveRecord::Relation, donors
    assert_kind_of Donation, donors[0]
  end

  test 'should have recipients to do with a donation' do
    id = 1
    get donations_url + "recipient/#{id}"
    recipients = @controller.send :recipient_json, id
    validate_ids recipients, id, :recipient_id
    assert_equal 1, recipients.length
    assert_kind_of ActiveRecord::Relation, recipients
    assert_kind_of Donation, recipients[0]
  end
end
