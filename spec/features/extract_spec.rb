require "spec_helper"

RSpec.describe "Extract command", type: :feature do
  it "outputs json" do
    expect { Kernel.require("#{ file_path }/../bin/extract.rb") }
      .to output(a_string_including( %({"artworks":[{"name":"The Starry Night") ))
      .to_stdout
  end

  describe "json output" do
    let!(:result) { capture{ Kernel.load("#{ file_path }/../bin/extract.rb") } }
    let!(:expected_array) { File.read("#{ file_path }/../files/expected-array.json") }

    let(:result_data) { JSON.parse(result[:stdout])}
    let(:expected_data) { JSON.parse(expected_array) }

    it "matches the expected json output" do
      result_data["artworks"].each_with_index do |artwork, index|
        expected = expected_data["artworks"][index].reject { |_, v| v == nil || v.empty? }

        expect(artwork["name"]).to eq(expected["name"])
        expect(artwork["extensions"]).to eq(expected["extensions"])
        expect(artwork["link"][0, 60]).to eq(expected["link"][0, 60])
        expect((artwork["image"] || "")[0, 60]).to eq((expected["image"] || "")[0, 60])
      end
    end
  end
end
