require "spec_helper"

RSpec.describe CarrouselNode do
  describe 'attributes' do
    before do
      browser.go_to("file://#{ File.expand_path(File.dirname(__FILE__)) }/ferrum/spec.html")
    end

    let!(:node) { browser.css(".appbar .klitem-tr")[0] }
    let(:subject) { CarrouselNode.new(node, "http://localhost") }
    let(:attrs) { subject.attributes }

    it "returns the node's name" do
      expect(attrs[:name]).to eq("The Starry Night")
    end

    it "returns the node's extensions" do
      expect(attrs[:extensions]).to eq(["1889"])
    end

    it "returns the node's link" do
      expect(attrs[:link]).to eq("http://localhost//search?gl=us&hl=en&q=The+Starry+Night&stick=H4sIAAAA")
    end

    it "returns the node's image" do
      expect(attrs[:image]).to eq("data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/")
    end
  end
end
