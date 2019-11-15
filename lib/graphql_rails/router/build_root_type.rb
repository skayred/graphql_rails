# frozen_string_literal: true

require 'graphql_rails/concerns/service'
require 'graphql_rails/controller/build_controller_action_resolver'


module GraphqlRails
  class Router
    # Builds schema root type
    class BuildRootType
      include Service
      def initialize(name:, routes:, group:)
        @name = name
        @routes = routes
        @group = group
      end

      def call
        type_name = name
        route_field_args = enable_route_field_args

        Class.new(GraphQL::Schema::Object) do
          graphql_name(type_name)
          route_field_args.each { |field_args| field(*field_args) }

          def self.inspect
            "#{GraphQL::Schema::Object}(#{graphql_name})"
          end
        end
      end

      private

      attr_reader :name, :group, :routes

      def enable_route_field_args
        enabled_routes.map { |route| field_args_for(route) }
      end

      def enabled_routes
        routes.select { |route| route.enabled_in_group?(group) }
      end

      def field_args_for(route)
        options = {}

        if route.function
          options[:function] = route.function
        else
          options[:resolver] = controller_resolver_for(route)
        end

        [route.name, options]
      end

      def controller_resolver_for(route)
        Controller::BuildControllerActionResolver.call(route: route, group: group)
      end
    end
  end
end
