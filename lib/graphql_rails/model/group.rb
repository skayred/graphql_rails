# frozen_string_literal: true

require 'graphql_rails/model/configurable'

module GraphqlRails
  module Model
    # handles attributes exposing by group
    class Group
      include Configurable

      def initialize(group_name)
        @group_name = group_name
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

      private

      attr_reader :group_name
    end
  end
end
