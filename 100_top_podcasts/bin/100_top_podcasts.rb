#!/usr/bin/env ruby

require "bundler/setup"
require "100_top_podcasts"

TopPodcasts::CLI.new.call
