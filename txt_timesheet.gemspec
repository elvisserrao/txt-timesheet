# frozen_string_literal: true

require_relative 'lib/txt_timesheet/version'

Gem::Specification.new do |spec|
  spec.name          = 'txt_timesheet'
  spec.version       = TxtTimesheet::VERSION
  spec.authors       = ['Elvis Serrão']
  spec.email         = ['elvis.serrao1@gmail.com']

  spec.summary       = 'Calculate Timesheet.'
  spec.description   = 'Receive n files as command line parameters, parse these files and than, calculates how many hours has been worked .'
  spec.homepage      = 'https://elvisserrao.github.io/'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata = {
    'homepage_uri' => 'https://elvisserrao.github.io/',
    'source_code_uri' => 'https://github.com/elvisserrao/txt-timesheet'
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
