class Cadooz::Immutable::VoucherInformation
  include Mixins

  attr_reader :response_state, :voucher_list

  def initialize(open_struct)
    @response_state = open_struct.try!(:response_state)
    @voucher_list = Array(open_struct.try!(:voucher_list))
	.try!(:each_with_object, []) { |v, arr| arr << Cadooz::Immutable::Voucher.new(v) }

    self.freeze
  end
end