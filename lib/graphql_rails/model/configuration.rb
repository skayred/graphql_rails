# frozen_string_literal: true

require 'graphql_rails/attributes'
require 'graphql_rails/model/build_graphql_type'
require 'graphql_rails/model/build_enum_type'
require 'graphql_rails/model/input'
require 'graphql_rails/model/configurable'
require 'graphql_rails/model/build_connection_type'
require 'graphql_rails/model/build_pagination_type'

module GraphqlRails
  module Model
    # stores information about model specific config, like attributes and types
    class Configuration
      include Configurable

      def initialize(model_class)
        @model_class = model_class
      end

      def initialize_copy(other)
        super
        @connection_type = nil
        @pagination_type = nil
        @graphql_type = nil
        @input = other.instance_variable_get(:@input)&.transform_values(&:dup)
        @attributes = other.instance_variable_get(:@attributes)&.transform_values(&:dup)
      end

      def attribute(attribute_name, **attribute_options)
        key = attribute_name.to_s

        attributes[key] ||= Attributes::Attribute.new(attribute_name)

        attributes[key].tap do |attribute|
          attribute_options.each do |method_name, args|
            attribute.public_send(method_name, args)
          end

          yield(attribute) if block_given?
        end
      end

      def input(input_name = nil)
        @input ||= {}
        name = input_name.to_s

        if block_given?
          @input[name] ||= Model::Input.new(model_class, input_name)
          yield(@input[name])
        end

        @input.fetch(name) do
          raise("GraphQL input with name #{input_name.inspect} is not defined for #{model_class.name}")
        end
      end

      def graphql_type
        @graphql_type ||= BuildGraphqlType.call(
          name: name, description: description, attributes: attributes
        )
      end

      def connection_type
        @connection_type ||= BuildConnectionType.call(graphql_type)
      end

      def pagination_type
        @pagination_type ||= BuildPaginationType.call(graphql_type)
      end

      private

      attr_reader :model_class

      def default_name
        @default_name ||= model_class.name.split('::').last
      end
    end
  end
end
