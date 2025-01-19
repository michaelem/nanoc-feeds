# frozen_string_literal: true
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem_extension(Nanoc)
loader.setup

module Nanoc::Feeds
  class Error < StandardError; end
end
