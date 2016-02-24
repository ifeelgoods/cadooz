class Cadooz::Immutable::CatalogProductVariation
  include Mixins

  attr_reader :currency, :name, :number, :value

  def initialize(open_struct)
    @currency = open_struct.try!(:currency)
    @name = open_struct.try!(:name)
    @number = open_struct.try!(:number)
    @value = Money.new((open_struct.try!(:value).try!(:to_f).try!(:*,  100)) || 0, @currency || 'USD')

    self.freeze
  end
end