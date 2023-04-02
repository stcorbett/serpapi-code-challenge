require 'ferrum'

require_relative '../lib/carrousel_node'

RSpec.shared_context "Global helpers" do
  attr_reader :browser
end

RSpec.configure do |config|
  config.before(:all) do
    config.include_context "Global helpers"

    options = {}
    @browser = Ferrum::Browser.new(options)
  end

  config.after(:all) do
    @browser.quit
  end
end
