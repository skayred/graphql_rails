# frozen_string_literal: true

module GraphqlRails
  # contains configuration options related with inputs
  module InputConfigurable
    def permit(*no_type_attributes, **typed_attributes)
      no_type_attributes.each { |attribute| permit_input(attribute) }
      typed_attributes.each { |attribute, type| permit_input(attribute, type: type) }
      self
    end

    def permit_input(name, **input_options)
      field_name = name.to_s.remove(/!\Z/)

      attributes[field_name] = build_input_attribute(name.to_s, **input_options)
      self
    end

    def paginated(pagination_options = {})
      pagination_options = {} if pagination_options == true
      pagination_options = nil if pagination_options == false

      @pagination_options = pagination_options
      permit(:before, :after, first: :int, last: :int)
    end

    def paginated?
      !pagination_options.nil?
    end

    def pagination_options
      @pagination_options
    end

    def classically_paginated(classic_pagination_options = {})
      classic_pagination_options = {} if classic_pagination_options == true
      classic_pagination_options = nil if classic_pagination_options == false

      @classic_pagination_options = classic_pagination_options
      permit(filter: :string, column: :string, direction: :int, page: :int)
    end

    def classically_paginated?
      !classic_pagination_options.nil?
    end

    def classic_pagination_options
      @classic_pagination_options
    end

    def input_attribute_options
      @input_attribute_options || {}
    end

    def build_input_attribute(name, options: {}, **other_options)
      Attributes::InputAttribute.new(
        name.to_s,
        options: input_attribute_options.merge(options),
        **other_options
      )
    end
  end
end
