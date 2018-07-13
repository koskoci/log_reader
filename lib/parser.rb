module Digest
  class Parser
    def initialize(file)
      @file = file
    end

    def parse
      data = File.read(file)
      hits = {}
      data.each_line do |line|
        path, client = line.split(" ")
        hits[path] ? hits[path] << client : hits[path] = [client]
      end
      hits
    end

    private

    attr_reader :file
  end
end