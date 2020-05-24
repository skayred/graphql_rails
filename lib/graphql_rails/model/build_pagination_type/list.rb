# frozen_string_literal: true

module GraphqlRails
  module Model
    class BuildPaginationType
      # Used when generating ConnectionType.
      # It handles all the logic which is related with counting total items
      class List
        require 'graphql_rails/concerns/service'

        include ::GraphqlRails::Service

        def initialize(graphql_object, _args, _ctx)
          @graphql_object = graphql_object
        end

        def call
          list
        end

        private

        attr_reader :graphql_object

        def list
          graphql_object
        end
      end
    end
  end
end
