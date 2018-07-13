require_relative "../../lib/processor"

module Digest
  RSpec.describe Processor do
    subject { described_class.new(hits) }

    let(:hits) do
      {
        "/home" => ["1.1.1.1", "2.2.2.2"],
        "/index" => ["2.2.2.2", "2.2.2.2", "2.2.2.2"]
      }
    end

    let(:histogram) do
      {
        "/index" => 3,
        "/home" => 2
      }
    end

    let(:unique_histogram) do
      {
        "/home" => 2,
        "/index" => 1
      }
    end

    describe "#histogram" do
      it "returns the visited pages, ordered by number of hits" do
        expect(subject.histogram).to eq histogram
      end
    end

    describe "#unique_histogram" do
      it "returns the visited pages, ordered by number of unique hits" do
        expect(subject.unique_histogram).to eq unique_histogram
      end
    end

    describe "#process" do
      it "returns the histogram and the unique historgram in an array" do
        expect(subject.process).to eq [histogram, unique_histogram]
      end
    end
  end
end