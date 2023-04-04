require "spec_helper"

RSpec.describe GoogleParser do
  describe 'An empty page' do
    let(:parser) { GoogleParser.new("file://#{ file_path }/ferrum/empty.html") }

    it "returns empty json" do
      expect(parser.json).to eq( %({\"artworks\":[]}) )
    end
  end

  describe 'A google search result page' do
    let(:parser) { GoogleParser.new("file://#{ file_path }/ferrum/spec.html") }
    let(:extracted) {JSON.parse(parser.json)}

    it "returns json with extracted artwork" do
      expect(extracted).to include(
        "artworks" => include(
          hash_including("name" => "The Starry Night"),
          hash_including("name" => "Irises")
        )
      )
    end
  end

  describe 'Updated carousel format on a google search' do
    let(:parser) { GoogleParser.new("file://#{ file_path }/ferrum/alt.html") }
    let(:extracted) {JSON.parse(parser.json)}

    it "returns json with extracted artwork" do
      expect(extracted).to include(
        "artworks" => include(
          hash_including("name" => "The Starry Night"),
          hash_including("name" => "Mickey"),
          hash_including("name" => "The Kiss")
        )
      )
    end
  end
end
