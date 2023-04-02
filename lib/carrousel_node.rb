class CarrouselNode
  attr_accessor :node, :url

  def initialize(node, url)
    @node = node
    @url = url
  end

  def attributes
    {
      name: node.at_css(".kltat").text,
      extensions: node.css(".klmeta").collect(&:text),
      link: "#{url}#{node.at_css("a").attribute("href")}",
      image: node.at_css("g-img img").attribute("src")
    }.reject { |_, v| v == nil || v.empty? }
  end

end
