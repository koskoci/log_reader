#!/usr/bin/ruby

require_relative "./lib/parser"
require_relative "./lib/processor"
require_relative "./lib/presenter"

file_name = ARGV.first
parsed = Digest::Parser.new(file_name).parse
processed = Digest::Processor.new(parsed).process
presented = Digest::Presenter.new(*processed).present
puts presented
