# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{kaminari}
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Akira Matsuda"]
  s.date = %q{2011-02-07}
  s.description = %q{Kaminari is a Scope & Engine based clean and powerful and customizable and sophisticated paginator for Rails 3}
  s.email = %q{ronnie@dio.jp}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "TODO.txt",
    "VERSION",
    "app/views/kaminari/_current_page.html.erb",
    "app/views/kaminari/_first_page_link.html.erb",
    "app/views/kaminari/_last_page_link.html.erb",
    "app/views/kaminari/_next_link.html.erb",
    "app/views/kaminari/_next_span.html.erb",
    "app/views/kaminari/_page_link.html.erb",
    "app/views/kaminari/_paginator.html.erb",
    "app/views/kaminari/_prev_link.html.erb",
    "app/views/kaminari/_prev_span.html.erb",
    "app/views/kaminari/_truncated_span.html.erb",
    "kaminari.gemspec",
    "lib/generators/kaminari/views_generator.rb",
    "lib/kaminari.rb",
    "lib/kaminari/active_record.rb",
    "lib/kaminari/engine.rb",
    "lib/kaminari/helpers.rb",
    "lib/kaminari/railtie.rb",
    "spec/controllers/application_helper_spec.rb",
    "spec/helpers/helpers_spec.rb",
    "spec/models/scopes_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/20110128122508_create_users.rb",
    "spec/support/matchers.rb",
    "spec/support/user.rb"
  ]
  s.homepage = %q{http://github.com/amatsuda/kaminari}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.4.2}
  s.summary = %q{A pagnation engine plugin for Rails 3}
  s.test_files = [
    "spec/controllers/application_helper_spec.rb",
    "spec/helpers/helpers_spec.rb",
    "spec/models/scopes_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/20110128122508_create_users.rb",
    "spec/support/matchers.rb",
    "spec/support/user.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 2.4.0"])
      s.add_development_dependency(%q<rr>, [">= 1.0.2"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<jeweler>, [">= 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<rails>, [">= 0"])
      s.add_development_dependency(%q<rack>, [">= 0"])
      s.add_development_dependency(%q<arel>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 1.3.3"])
      s.add_development_dependency(%q<ruby-debug>, [">= 0"])
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0"])
    else
      s.add_dependency(%q<rspec>, [">= 2.4.0"])
      s.add_dependency(%q<rr>, [">= 1.0.2"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<jeweler>, [">= 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 0"])
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<arel>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 1.3.3"])
      s.add_dependency(%q<ruby-debug>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 3.0.0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 2.4.0"])
    s.add_dependency(%q<rr>, [">= 1.0.2"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<jeweler>, [">= 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 0"])
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<arel>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 1.3.3"])
    s.add_dependency(%q<ruby-debug>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 3.0.0"])
  end
end

