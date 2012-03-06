# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "longitude/version"

Gem::Specification.new do |s|
  s.name        = "longitude"
  s.version     = Longitude::VERSION
  s.authors     = ["Johannes Edelstam"]
  s.email       = ["johannes@edelst.am"]
  s.homepage    = "http://github.com/jede/longitude"
  s.license     = "MIT"
  s.summary     = %q{A responsive, mobile first, unobtrusive SCSS grid!}
  s.description = """Lets you easily using SCSS create responsive, mobile first layouts with minimal footprint in an unobtrusive way!

Longitude is more a collection of calculations than just a normal CSS grid. It lets you define how elements will be styled based on your class hierarchy, not the framework's."""

  s.rubyforge_project = "longitude"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rake'
  s.add_development_dependency "rspec"

  s.add_runtime_dependency "sass", ">= 3.2.beta"
end
