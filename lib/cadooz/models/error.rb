class Cadooz::Error

  attr_accessor :code, :name, :message

  def initialize(code:, name:, message:)
    @code = code
    @name = name
    @message = message
  end
end