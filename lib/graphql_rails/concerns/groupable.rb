# frozen_string_literal: true

module GraphqlRails
  # Adds group scoping related methods
  module Groupable
    def enabled_in_group?(group_name)
      return true if groups.nil? || groups.empty?

      groups.include?(group_name&.to_sym)
    end
  end
end
