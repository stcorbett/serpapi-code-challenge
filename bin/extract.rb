require_relative '../lib/google_parser.rb'

input = "file://#{ File.expand_path(File.dirname(__FILE__)) }/../files/van-gogh-paintings.html"
input = ARGV[0] if ARGV[0] && !ARGV[0].include?("--")

parser = GoogleParser.new(input)

puts parser.json
