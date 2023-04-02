require 'ferrum'
require 'json'
require_relative './carrousel_node'

class GoogleParser
  def initialize(filename)
    @browser = Ferrum::Browser.new
    @browser.go_to(filename)
  end

  def json
    {
      artworks: carrousel_nodes.map(&:attributes)
    }.to_json
  end

  private
  def carrousel_nodes
    @carrousel_nodes ||= @browser.css(".appbar .klitem-tr").collect do |node|
      CarrouselNode.new(node, 'https://www.google.com')
    end
  end

end
