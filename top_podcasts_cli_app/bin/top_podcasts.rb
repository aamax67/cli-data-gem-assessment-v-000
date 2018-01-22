#!/usr/bin/env ruby

require "bundler/setup"
require_relative "../lib/top_podcasts"

TopPodcasts::CLI.new.call
