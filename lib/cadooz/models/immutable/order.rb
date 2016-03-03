class Cadooz::Immutable::Order
  include Mixins

  attr_reader :client, :commission, :cost_owner, :cost_unit, :credit_or_number,
              :customer_reference_number, :delivery_address, :generation_profile,
              :greeting_card, :invoice_address, :invoice_information, :language,
              :order_attributes, :order_description, :order_positions, :payment_informations,
              :queue, :send_mail, :test, :website

  def initialize(open_struct)
    @client = open_struct.try!(:client)
    @commission = open_struct.try!(:commission)
    @cost_owner = open_struct.try!(:cost_owner)
    @cost_unit = open_struct.try!(:cost_unit)
    @credit_or_number = open_struct.try!(:credit_or_number)
    @customer_reference_number = open_struct.try!(:customer_reference_number)
    @delivery_address = Cadooz::Immutable::Address.new(open_struct.try!(:delivery_address))
    @generation_profile = open_struct.try!(:generation_profile)
    @greeting_card = Cadooz::Immutable::GreetingCard.new(open_struct.try!(:greeting_card))
    @invoice_address = Cadooz::Immutable::Address.new(open_struct.try!(:invoice_address))
    @invoice_information = Array(open_struct.try!(:invoice_information)).try!(:each_with_object, []) { |i, arr| arr << Cadooz::Immutable::InvoiceInformation.new(i) }
    @language = open_struct.try!(:language)
    @order_attributes = open_struct.try!(:order_attributes).try!(:inject, {}) { |hash, element| hash.merge(element.key.to_sym => element.value) }
    @order_description = open_struct.try!(:order_description)
    @order_positions = Array(open_struct.try!(:order_positions)).try!(:each_with_object, []) { |o, arr| arr << Cadooz::Immutable::OrderPosition.new(o) }
    @payment_informations = open_struct.try!(:payment_informations)
    @queue = open_struct.try!(:queue)
    @send_mail = open_struct.try!(:send_mail)
    @test = open_struct.try!(:test)
    @website = open_struct.try!(:website)

    self.freeze
  end
end