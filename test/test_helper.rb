ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  setup do
    @ripley = users(:ripley)
    @parker = users(:parker)

    @squeezie = circuits(:squeezie)
    @greenbox = circuits(:greenbox)
    @orangebox = circuits(:orangebox)
    @digipeat = circuits(:digipeat)
    @vermin = circuits(:vermin)

    @article = articles(:one)
    @article2 = articles(:two)

    @overdrive = effect_types(:overdrive)
    @compression = effect_types(:compression)
    @delay = effect_types(:delay)
  end
end
