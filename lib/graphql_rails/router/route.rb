# frozen_string_literal: true

require_relative '../controller/build_controller_action_resolver'
require 'graphql_rails/concerns/groupable'

module GraphqlRails
  class Router
    # Generic class for any type graphql action. Should not be used directly
    class Route
      include Groupable

      attr_reader :name, :module_name, :on, :relative_path, :function

      def initialize(name, to: '', on:, groups: nil, **options)
        @name = name.to_s.camelize(:lower)
        @module_name = options[:module].to_s
        @function = options[:function]
        @groups = groups
        @relative_path = to
        @on = on.to_sym
      end

      def path
        return relative_path if module_name.empty?

        [module_name, relative_path].join('/')
      end

      def collection?
        on == :collection
      end

      def field_args
        options = {}

        if function
          options[:function] = function
        else
          options[:resolver] = resolver
        end

        [name, options]
      end

      private

      attr_reader :groups
    end
  end
end
