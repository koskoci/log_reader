require_relative "../../lib/presenter"

module Digest
  RSpec.describe Presenter do
    subject { described_class.new(histogram, unique_histogram) }

    let(:histogram) do
      {
        "/home" => 2,
        "/index" => 3
      }
    end

    let(:unique_histogram) do
      {
        "/index" => 1,
        "/home" => 2
      }
    end

    let(:output) do
      <<~OUTPUT
        Webpages by number of visits:
        *  /index 3 visits
        *  /home 2 visits

        Webpages by number of unique visits:
        *  /home 2 unique views
        *  /index 1 unique views
      OUTPUT
    end

    describe "#present" do
      it "returns the desired output" do
        expect(subject.present).to eq output
      end
    end
  end
end