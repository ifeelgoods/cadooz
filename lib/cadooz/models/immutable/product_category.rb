class Cadooz::Immutable::ProductCategory
  include Mixins

  attr_reader :id, :description, :internal_name, :shop_name

  def initialize(open_struct)
    @id = open_struct.try!(:id)
    @description = open_struct.try!(:description)
                              .try!(:map_entries)
                              .try!(:elements)
                              .try!(:inject, {}) { |hash, element| hash.merge(element.key.to_sym => element.value) }
    @internal_name = open_struct.try!(:internal_name)
    @shop_name = open_struct.try!(:shop_name)
                            .try!(:map_entries)
                            .try!(:elements)
                            .try!(:inject, {}) { |hash, element| hash.merge(element.key.to_sym => element.value) }

    self.freeze
  end
end