# frozen_string_literal: true

require 'graphql_rails/router/build_root_type'

module GraphqlRails
  class Router
    # builds GraphQL::Schema based on previously defined grahiti data
    class SchemaBuilder
      require_relative './plain_cursor_encoder'

      attr_reader :queries, :mutations, :raw_actions

      def initialize(queries:, mutations:, raw_actions:, group: nil)
        @queries = queries
        @mutations = mutations
        @raw_actions = raw_actions
        @group = group
      end

      def call
        query_type = build_query_root_type
        mutation_type = build_mutation_root_type
        raw = raw_actions

        Class.new(GraphQL::Schema) do
          cursor_encoder(Router::PlainCursorEncoder)
          raw.each { |action| send(action[:name], *action[:args], &action[:block]) }

          query(query_type)
          mutation(mutation_type)
        end
      end

      private

      attr_reader :group

      def build_query_root_type
        BuildRootType.call(name: 'Query', routes: queries, group: group)
      end

      def build_mutation_root_type
        BuildRootType.call(name: 'Mutation', routes: mutations, group: group)
      end
    end
  end
end
