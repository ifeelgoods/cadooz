class Cadooz::Immutable::GreetingCard
  include Mixins

  attr_reader :subject, :text

  def initialize(open_struct)
    @subject = open_struct.try!(:subject)
    @text = open_struct.try!(:text)

    self.freeze
  end
end