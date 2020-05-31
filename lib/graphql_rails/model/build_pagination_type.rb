# frozen_string_literal: true

require 'graphql'
require 'graphql_rails/model/build_pagination_type/list'
require 'graphql_rails/model/build_pagination_type/cursor'

module GraphqlRails
  module Model
    # builds connection type from graphql type with some extra attributes
    class BuildPaginationType
      require 'graphql_rails/concerns/service'

      include ::GraphqlRails::Service

      attr_reader :initial_type

      def initialize(initial_type)
        @initial_type = initial_type
      end

      def call
        build_pagination_type
      end

      private

      def build_pagination_type
        cursor_type = build_cursor_type
        type = initial_type
        Class.new(GraphQL::Schema::Object) do
          def self.name
            "Paginatable"
          end
          graphql_name("#{type.graphql_name}Paginated")

          field :entities, [type], null: false, resolve: List
          field :cursor, cursor_type, null: false, resolve: Cursor
        end
      end

      def build_cursor_type
        type = initial_type

        Class.new(GraphQL::Schema::Object) do
          graphql_name("#{type.graphql_name}Cursor")

          field :total_pages, 'Int', null: false
          field :total_items, 'Int', null: false
          field :current_page, 'Int', null: false
        end
      end
    end
  end
end
