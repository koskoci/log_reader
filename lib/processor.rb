module Digest
  class Processor
    def initialize(hits)
      @hits = hits
    end

    def histogram
      hits.map { |k,v| [k, v.count] }.to_h
    end

    def unique_histogram
      hits.map { |k,v| [k, v.uniq.count] }.to_h
    end

    def process
      [histogram, unique_histogram]
    end

    private

    attr_reader :hits
  end
end