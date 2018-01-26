#!/usr/bin/env ruby

require "bundler/setup"
require "../lib/top_podcasts"

TopPodcasts::CLI.new.call
