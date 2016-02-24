class Cadooz::Immutable::Payment
  include Mixins

  attr_reader :attributes, :description, :paid, :type, :value, :verified

  def initialize(open_struct)
    @attributes = open_struct.try!(:attributes)
                             .try!(:map_entries)
                             .try!(:elements)
                             .try!(:inject, {}) { |hash, element| hash.merge(element.key.to_sym => element.value) }
    @description = open_struct.try!(:description)
    @paid = open_struct.try!(:paid)
    @type = open_struct.try!(:type)
    @value = open_struct.try!(:value)
    @verified = open_struct.try!(:verified)

    self.freeze
  end
end