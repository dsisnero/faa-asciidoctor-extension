# frozen_string_literal: true

require_relative "lib/faa/asciidoctor/extension/version"

Gem::Specification.new do |spec|
  spec.name = "faa-asciidoctor-extension"
  spec.version = Faa::Asciidoctor::Extension::VERSION
  spec.authors = ["Dominic Sisneros"]
  spec.email = ["dsisnero@gmail.com"]

  spec.summary = "faa asciidoctor extensions"
  spec.description = "jcn processor for asciidoctor"
  spec.homepage = "https://github.com/dsisnero/faa-asciidoctor-extension"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/dsisnero/faa-asciidoctor-extension.git"
  spec.metadata["changelog_uri"] = "https://github.com/dsisnero/faa-asciidoctor-extension/CHANGELOG"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency("asciidoctor", "~> 2.0")
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "solargraph"
  spec.add_development_dependency "standardrb"
  spec.add_development_dependency "ruby-lsp"
end
