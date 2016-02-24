class Cadooz::Immutable::GenerationProfileProduct
  include Mixins

  attr_reader :cadooz_product_number, :custom_value, :external_product_number, :value

  def initialize(open_struct)
    @cadooz_product_number = open_struct.try!(:cadooz_product_number)
    @custom_value = open_struct.try!(:custom_value)
    @external_product_number = open_struct.try!(:external_product_number)
    @value = open_struct.try!(:value)

    self.freeze
  end
end