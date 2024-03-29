require "administrate/field/base"

class MultipleSelectField < Administrate::Field::Select
  def to_s
    data
  end

  def self.permitted_attribute(attribute, _options = nil)
    { attribute.to_sym => [] }
  end

  def permitted_attribute
    self.class.permitted_attribute(attribute)
  end
end
