class Cadooz::Immutable::Attributes
  include Mixins

  attr_reader :attribute, :values

  def initialize(open_struct)
    @attribute = open_struct.try!(:attribute)
    @values = open_struct.try!(:values)
                         .try!(:map_entries)
                         .try!(:elements)
                         .try!(:inject, {}) { |hash, element| hash.merge(element.key.to_sym => element.value) }
    self.freeze
  end
end