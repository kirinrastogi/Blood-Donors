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
end
