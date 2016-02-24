class Cadooz::Immutable::OrderPosition
  include Mixins

  attr_reader :amount, :attributes, :cadooz_product_number, :currency,
              :delivery_address, :external_reference_number, :greeting_card,
              :value, :voucher_address, :voucher_address_editable,
              :voucher_address_preset

  def initialize(open_struct)
    @amount = open_struct.try!(:amount)
    @attributes = open_struct.try!(:attributes).try!(:inject, {}) { |hash, element| hash.merge(element.key.to_sym => element.value) }
    @cadooz_product_number = open_struct.try!(:cadooz_product_number)
    @currency = open_struct.try!(:currency)
    @delivery_address = open_struct.try!(:delivery_address)
    @external_reference_number = open_struct.try!(:external_reference_number)
    @greeting_card = open_struct.try!(:greeting_card)
    @value = open_struct.try!(:value)
    @voucher_address = open_struct.try!(:voucher_address)
    @voucher_address_editable = open_struct.try!(:voucher_address_editable)
    @voucher_address_preset = open_struct.try!(:voucher_address_preset)

    self.freeze
  end
end