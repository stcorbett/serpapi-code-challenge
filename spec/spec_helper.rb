require 'ferrum'

require_relative '../lib/carrousel_node'
require_relative '../lib/google_parser'

RSpec.shared_context "Global helpers" do
  attr_reader :browser, :file_path

  def capture(&block)
    begin
      $stdout = StringIO.new
      $stderr = StringIO.new
      yield
      result = {}
      result[:stdout] = $stdout.string
      result[:stderr] = $stderr.string
    ensure
      $stdout = STDOUT
      $stderr = STDERR
    end
    result
  end
end

RSpec.configure do |config|
  config.before(:all) do
    config.include_context "Global helpers"

    options = {}
    @browser = Ferrum::Browser.new(options)

    @file_path = File.expand_path(File.dirname(__FILE__))
  end

  config.after(:all) do
    @browser.quit
  end
end
