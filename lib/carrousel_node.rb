class CarrouselNode
  attr_accessor :node, :url

  def initialize(node, url)
    @node = node
    @url = url
  end

  def attributes
    {
      name: text_node&.text,
      extensions: extensions_nodes&.collect(&:text),
      link: link,
      image: node.at_css("g-img img")&.attribute("src")
    }.reject { |_, v| v == nil || v.empty? }
  end

  private
  def link
    href = anchor_node&.attribute("href")
    href.include?("http") ? href : "#{url}#{href}"
  end

  def anchor_node
    node.tag_name == 'a' ? node : node.at_css("a")
  end

  def text_node
    node.at_css(".kltat") || node.at_xpath(%(child::*/div/div[3]/div/div[1]))
  end

  def extensions_nodes
    if !node.css(".klmeta").empty?
      node.css(".klmeta")
    else
      node.at_xpath(%(child::*/div/div[3]/div/div[2]))&.xpath("div")
    end
  end
end
