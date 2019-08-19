Gem::Specification.new do |s|
  s.name = "studio_game"
  s.version = "0.5"
  s.author = "Clyde Westrich"
  s.email = "trey@treywestrich.com"
  s.homepage = "https://www.treywestrich.com/"
  s.summary = "Coding Practice 'Game'"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec', '~> 2.8', '>= 2.8.0'
end
