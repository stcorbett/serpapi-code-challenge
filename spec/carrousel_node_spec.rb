require "spec_helper"

RSpec.describe CarrouselNode do
  describe 'attributes' do
    let(:node) { browser.css(".appbar .klitem-tr")[0] }
    let(:subject) { CarrouselNode.new(node, "http://localhost") }
    let(:attrs) { subject.attributes }

    describe 'basic format' do
      before {browser.go_to("file://#{ file_path }/ferrum/spec.html")}

      it "returns the node's name" do
        expect(attrs[:name]).to eq("The Starry Night")
      end

      it "returns the node's extensions" do
        expect(attrs[:extensions]).to eq(["1889"])
      end

      it "returns the node's link" do
        expect(attrs[:link]).to eq("http://localhost/search?gl=us&hl=en&q=The+Starry+Night&stick=H4sIAAAA")
      end

      it "returns the node's image" do
        expect(attrs[:image]).to eq("data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/")
      end
    end

    describe 'alternate carrousel format' do
      before {browser.go_to("file://#{ file_path }/ferrum/alt.html")}

      it "returns the node's name" do
        expect(attrs[:name]).to eq("The Starry Night")
      end

      it "returns the node's extensions" do
        expect(attrs[:extensions]).to eq(["Vincent van Gogh"])
      end

      it "returns the node's link" do
        expect(attrs[:link]).to include("https://www.google.com/search?biw=1216&bih=709&q=The+Starry+Night")
      end

      it "returns the node's image" do
        expect(attrs[:image]).to include("2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUF")
      end
    end
  end
end
