ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  #load "#{Rails.root}/db/seeds.rb"

  def base_url
    'http://localhost:3000'
  end

  def donors_url
    "#{base_url}/donors/"
  end

  def donations_url
    "#{base_url}/donations/"
  end

  def recipients_url
    "#{base_url}/recipients/"
  end

  def nurses_url
    "#{base_url}/nurses/"
  end

  def present_nurses_url
    "#{base_url}/present_nurses/"
  end
end
