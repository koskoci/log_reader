require_relative "../../lib/parser"

module Digest
  RSpec.describe Parser do
    subject { described_class.new("fuu.log") }

    let(:data) do
      <<~DATA
        /home 1.1.1.1
        /index 2.2.2.2
        /index 3.3.3.3
      DATA
    end

    let(:hits) do
      {
        "/home" => ["1.1.1.1"],
        "/index" => ["2.2.2.2", "3.3.3.3"]
      }
    end

    before do
      allow(File).to receive(:read).and_return(data)
    end

    describe "#parse" do
      it "returns the hits in a hash" do
        expect(subject.parse).to eq hits
      end
    end
  end
end