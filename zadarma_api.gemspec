
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "zadarma_api/version"

Gem::Specification.new do |spec|
  spec.name          = "zadarma_api"
  spec.version       = ZadarmaApi::VERSION
  spec.authors       = ["Rostyslav Diachok"]
  spec.email         = ["infernalmaster1@gmail.com"]

  spec.summary       = %q{zadarma API ruby client}
  spec.description   = %q{Thin ruby client for https://zadarma.com API}
  spec.homepage      = "https://github.com/infernalmaster/zadarma_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_runtime_dependency "rest-client", "~> 2.0"
end
