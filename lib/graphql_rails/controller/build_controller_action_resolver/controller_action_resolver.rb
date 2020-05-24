# frozen_string_literal: true

require 'graphql_rails/controller/request'

module GraphqlRails
  class Controller
    class BuildControllerActionResolver
      # Resolver which includes controller specific methods.
      # Used to simplify resolver build for each controller action
      class ControllerActionResolver < GraphQL::Schema::Resolver
        def self.controller(controller_class = nil)
          @controller = controller_class if controller_class
          @controller
        end

        def self.controller_action_name(name = nil)
          @controller_action_name = name if name
          @controller_action_name
        end

        def resolve(**inputs)
          request = Request.new(object, inputs, context)

          result = self.class.controller.new(request).call(self.class.controller_action_name)

          if self.class.name == 'Paginatable'
            column = inputs[:column] || 'id'
            direction = 'asc'
            if inputs[:direction] < 0
              direction = 'desc'
            end
            return result.where("name LIKE ?", "%#{ActiveRecord::Base::sanitize_sql_like(inputs[:filter])}%").order("#{column} #{direction}").paginate(page: inputs[:page])
          end

          result
        end
      end
    end
  end
end
