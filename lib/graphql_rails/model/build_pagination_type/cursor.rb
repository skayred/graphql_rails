# frozen_string_literal: true

module GraphqlRails
  module Model
    class BuildPaginationType
      # Used when generating ConnectionType.
      # It handles all the logic which is related with counting total items
      class Cursor
        require 'graphql_rails/concerns/service'

        include ::GraphqlRails::Service

        def initialize(graphql_object, _args, _ctx)
          @graphql_object = graphql_object
        end

        def call
          if active_record?
            {
                total_pages: (list.total_entries/list.per_page).ceil,
                current_page: list.current_page
            }
          else
            {
                total_pages: 1,
                current_page: 1
            }
          end
        end

        private

        attr_reader :graphql_object

        def list
          graphql_object
        end

        def active_record?
          defined?(ActiveRecord) && list.is_a?(ActiveRecord::Relation)
        end
      end
    end
  end
end
