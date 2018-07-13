module Digest
  class Presenter
    def initialize(histogram, unique_histogram)
      @histogram = histogram
      @unique_histogram = unique_histogram
    end

    def present
      <<~OUTPUT
        Webpages by number of visits:
        #{histogram_list}

        Webpages by number of unique visits:
        #{unique_histogram_list}
      OUTPUT
    end

    private

    attr_reader :histogram, :unique_histogram

    def sort_by_value(hash)
      hash.sort_by {|_, value| value}.reverse
    end

    def histogram_list
      sorted_histogram = sort_by_value(histogram)

      sorted_histogram.inject("") do |output, item|
        output << "*  #{item[0]} #{item[1]} visits\n"
      end.strip
    end

    def unique_histogram_list
      sorted_unique_histogram = sort_by_value(unique_histogram)

      sorted_unique_histogram.inject("") do |output, item|
        output << "*  #{item[0]} #{item[1]} unique views\n"
      end.strip
    end
  end
end