ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  #load "#{Rails.root}/db/seeds.rb"

  def donors_url
    'http://localhost:3000/donors/'
  end

  def donations_url
    'http://localhost:3000/donations/'
  end

  def recipients_url
    'http://localhost:3000/recipients/'
  end

  def nurses_url
    'http://localhost:3000/nurses/'
  end

  def present_nurses_url
    'http://localhost:3000/present_nurses/'
  end
end
