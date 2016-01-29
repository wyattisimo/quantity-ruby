Gem::Specification.new do |s|
  s.name     = 'quantity-ruby'
  s.version  = '0.3'
  s.platform = Gem::Platform::RUBY
  s.homepage = 'http://github.com/wyattisimo/quantity-ruby'
  s.summary  = 'Quantity stuff.'
  s.author   = 'Jared Wyatt'
  s.email    = 'j@wyatt.co'
  s.license  = 'MIT'

  s.files         = Dir.glob('lib/**/*') + %w(LICENSE README.md)
  s.require_paths = ['lib']
end
