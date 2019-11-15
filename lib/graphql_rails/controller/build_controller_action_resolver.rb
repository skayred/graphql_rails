# frozen_string_literal: true

require 'graphql_rails/controller/action'
require 'graphql_rails/concerns/service'
require 'graphql_rails/controller/build_controller_action_resolver/controller_action_resolver'

module GraphqlRails
  class Controller
    # graphql resolver which redirects actions to appropriate controller and controller action
    class BuildControllerActionResolver
      include ::GraphqlRails::Service

      def initialize(route:, group: group)
        @route = route
        @group = group
      end

      def call # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        action = build_action

        Class.new(ControllerActionResolver) do
          type(*action.type_args)
          description(action.description)
          controller(action.controller)
          controller_action_name(action.name)

          action.arguments.each do |attribute|
            argument(*attribute.input_argument_args)
          end

          def self.inspect
            "ControllerActionResolver(#{controller.name}##{controller_action_name})"
          end
        end
      end

      private

      attr_reader :route, :group

      def build_action
        Action.new(route, group: group)
      end
    end
  end
end
