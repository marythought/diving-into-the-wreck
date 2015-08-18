# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "Diving Into the Wreck"
  spec.version       = '1.0'
  spec.authors       = ["Mary Dickson"]
  spec.email         = ["mdickson@gmail.com"]
  spec.summary       = %q{Interactive game based on a poem}
  spec.description   = %q{Based on Adrienne Rich's 'Diving into the Wreck.' Created for Ruby for the Hard Way tutorial.}
  spec.homepage      = "http://www.marydickson.com/"
  spec.license       = "MIT"

  spec.files         = ['lib/diving.rb']
  spec.executables   = ['bin/app.rb']
  spec.test_files    = ['tests/test_diving.rb']
  spec.require_paths = ["lib"]
end
