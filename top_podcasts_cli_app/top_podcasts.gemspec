
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "top_podcasts/version"

Gem::Specification.new do |spec|
  spec.name          = "top_podcasts"
  spec.version       = TopPodcasts::VERSION
  spec.authors       = ["'Aaron Lieberman'"]
  spec.email         = ["'aaronmaxmusic@gmail.com'"]

  spec.summary       = %q{"This a list of the top 200 podcasts"}
  spec.description   = %q{"Choose to learn about your favorite podcasts."}
  spec.homepage      = "https://github.com/learn-co-students/cli-data-gem-assessment-v-000"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_development_dependency "nokogiri"

end
