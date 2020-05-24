# -*- encoding: utf-8 -*-
# stub: graphql_rails 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "graphql_rails".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Povilas Jur\u010Dys".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-05-23"
  s.email = ["po.jurcys@gmail.com".freeze]
  s.files = [".gitignore".freeze, ".hound.yml".freeze, ".rspec".freeze, ".rubocop.yml".freeze, ".ruby-version".freeze, ".travis.yml".freeze, "CHANGELOG.md".freeze, "CODE_OF_CONDUCT.md".freeze, "Gemfile".freeze, "Gemfile.lock".freeze, "LICENSE.txt".freeze, "Rakefile".freeze, "bin/console".freeze, "bin/setup".freeze, "docs/.nojekyll".freeze, "docs/README.md".freeze, "docs/_sidebar.md".freeze, "docs/components/controller.md".freeze, "docs/components/decorator.md".freeze, "docs/components/model.md".freeze, "docs/components/routes.md".freeze, "docs/getting_started/quick_start.md".freeze, "docs/getting_started/setup.md".freeze, "docs/index.html".freeze, "docs/logging_and_monitoring/logging_and_monitoring.md".freeze, "docs/other_tools/query_runner.md".freeze, "docs/other_tools/schema_dump.md".freeze, "docs/testing/testing.md".freeze, "graphql_rails.gemspec".freeze, "lib/generators/graphql_rails/install_generator.rb".freeze, "lib/generators/graphql_rails/templates/example_users_controller.erb".freeze, "lib/generators/graphql_rails/templates/graphql_application_controller.erb".freeze, "lib/generators/graphql_rails/templates/graphql_controller.erb".freeze, "lib/generators/graphql_rails/templates/graphql_router.erb".freeze, "lib/generators/graphql_rails/templates/graphql_router_spec.erb".freeze, "lib/graphql_rails.rb".freeze, "lib/graphql_rails/attributes.rb".freeze, "lib/graphql_rails/attributes/attributable.rb".freeze, "lib/graphql_rails/attributes/attribute.rb".freeze, "lib/graphql_rails/attributes/attribute_name_parser.rb".freeze, "lib/graphql_rails/attributes/input_attribute.rb".freeze, "lib/graphql_rails/attributes/input_type_parser.rb".freeze, "lib/graphql_rails/attributes/type_name_info.rb".freeze, "lib/graphql_rails/attributes/type_parseable.rb".freeze, "lib/graphql_rails/attributes/type_parser.rb".freeze, "lib/graphql_rails/concerns/service.rb".freeze, "lib/graphql_rails/controller.rb".freeze, "lib/graphql_rails/controller/action.rb".freeze, "lib/graphql_rails/controller/action_configuration.rb".freeze, "lib/graphql_rails/controller/action_hook.rb".freeze, "lib/graphql_rails/controller/action_hooks_runner.rb".freeze, "lib/graphql_rails/controller/build_controller_action_resolver.rb".freeze, "lib/graphql_rails/controller/build_controller_action_resolver/controller_action_resolver.rb".freeze, "lib/graphql_rails/controller/configuration.rb".freeze, "lib/graphql_rails/controller/log_controller_action.rb".freeze, "lib/graphql_rails/controller/request.rb".freeze, "lib/graphql_rails/controller/request/format_errors.rb".freeze, "lib/graphql_rails/decorator.rb".freeze, "lib/graphql_rails/decorator/relation_decorator.rb".freeze, "lib/graphql_rails/errors/custom_execution_error.rb".freeze, "lib/graphql_rails/errors/error.rb".freeze, "lib/graphql_rails/errors/execution_error.rb".freeze, "lib/graphql_rails/errors/system_error.rb".freeze, "lib/graphql_rails/errors/validation_error.rb".freeze, "lib/graphql_rails/input_configurable.rb".freeze, "lib/graphql_rails/integrations.rb".freeze, "lib/graphql_rails/integrations/lograge.rb".freeze, "lib/graphql_rails/integrations/sentry.rb".freeze, "lib/graphql_rails/model.rb".freeze, "lib/graphql_rails/model/build_connection_type.rb".freeze, "lib/graphql_rails/model/build_connection_type/count_items.rb".freeze, "lib/graphql_rails/model/build_enum_type.rb".freeze, "lib/graphql_rails/model/build_graphql_input_type.rb".freeze, "lib/graphql_rails/model/build_graphql_type.rb".freeze, "lib/graphql_rails/model/call_graphql_model_method.rb".freeze, "lib/graphql_rails/model/configurable.rb".freeze, "lib/graphql_rails/model/configuration.rb".freeze, "lib/graphql_rails/model/input.rb".freeze, "lib/graphql_rails/query_runner.rb".freeze, "lib/graphql_rails/railtie.rb".freeze, "lib/graphql_rails/router.rb".freeze, "lib/graphql_rails/router/mutation_route.rb".freeze, "lib/graphql_rails/router/plain_cursor_encoder.rb".freeze, "lib/graphql_rails/router/query_route.rb".freeze, "lib/graphql_rails/router/resource_routes_builder.rb".freeze, "lib/graphql_rails/router/route.rb".freeze, "lib/graphql_rails/router/schema_builder.rb".freeze, "lib/graphql_rails/rspec_controller_helpers.rb".freeze, "lib/graphql_rails/tasks/dump_graphql_schema.rb".freeze, "lib/graphql_rails/tasks/schema.rake".freeze, "lib/graphql_rails/version.rb".freeze]
  s.homepage = "https://github.com/samesystem/graphql_rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.6".freeze
  s.summary = "Rails style structure for GraphQL API.".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<graphql>.freeze, [">= 1.9.12"])
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 4"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.16"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<activerecord>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry-byebug>.freeze, [">= 0"])
      s.add_development_dependency(%q<rails>.freeze, ["~> 5"])
    else
      s.add_dependency(%q<graphql>.freeze, [">= 1.9.12"])
      s.add_dependency(%q<activesupport>.freeze, [">= 4"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.16"])
      s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<activerecord>.freeze, [">= 0"])
      s.add_dependency(%q<pry-byebug>.freeze, [">= 0"])
      s.add_dependency(%q<rails>.freeze, ["~> 5"])
    end
  else
    s.add_dependency(%q<graphql>.freeze, [">= 1.9.12"])
    s.add_dependency(%q<activesupport>.freeze, [">= 4"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.16"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<activerecord>.freeze, [">= 0"])
    s.add_dependency(%q<pry-byebug>.freeze, [">= 0"])
    s.add_dependency(%q<rails>.freeze, ["~> 5"])
  end
end
