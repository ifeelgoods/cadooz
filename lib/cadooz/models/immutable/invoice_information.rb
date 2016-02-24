class Cadooz::Immutable::InvoiceInformation
  include Mixins

  attr_reader :debitor_number, :value

  def initialize(open_struct)
    @debitor_number = open_struct.try!(:debitor_number)
    @value = open_struct.try!(:value)

    self.freeze
  end
end