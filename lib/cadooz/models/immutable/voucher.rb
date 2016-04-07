class Cadooz::Immutable::Voucher
  include Mixins

  attr_reader :address, :code, :ecard_link, :evoucher_link,
              :pin, :product_name, :product_number,
              :product_variation_number, :serial_number, :value

  def initialize(open_struct)
    @address = Cadooz::Immutable::Address.new(open_struct.try!(:address))
    @code = open_struct.try!(:code)
    @currency = open_struct.try!(:currency)
    @ecard_link = open_struct.try!(:ecard_link)
    @evoucher_link = open_struct.try!(:evoucher_link)
    @pin = open_struct.try!(:pin)
    @product_name = open_struct.try!(:product_name)
    @product_number = open_struct.try!(:product_number)
    @product_variation_number = open_struct.try!(:product_variation_number)
    @serial_number = open_struct.try!(:serial_number)
    @value = open_struct.try!(:value).try!(:to_f)

    self.freeze
  end
end