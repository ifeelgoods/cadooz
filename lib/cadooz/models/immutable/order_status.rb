class Cadooz::Immutable::OrderStatus
  include Mixins

  attr_reader :delivery_state, :message, :order_number, :order_state,
              :packet_number, :return_reason, :shipping_provider

  def initialize(open_struct)
    @delivery_state = open_struct.try!(:delivery_state)
    @message = open_struct.try!(:message)
    @order_number = open_struct.try!(:order_number)
    @order_state = open_struct.try!(:order_state)
    @packet_number = open_struct.try!(:packet_number)
    @return_reason = open_struct.try!(:return_reason)
    @shipping_provider = open_struct.try!(:shipping_provider)

    self.freeze
  end
end