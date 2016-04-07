class Cadooz::Immutable::Address
  include Mixins

  attr_reader :city, :company, :country, :department, :email, :firstname,
              :lastname, :phone, :salutation, :state, :street,
              :street_addon, :zip_code

  def initialize(open_struct)
    @city = open_struct.try!(:city)
    @company =open_struct.try!(:company)
    @country = open_struct.try!(:country)
    @department = open_struct.try!(:department)
    @email = open_struct.try!(:email)
    @firstname = open_struct.try!(:firstname)
    @lastname = open_struct.try!(:lastname)
    @phone = open_struct.try!(:phone)
    @salutation = open_struct.try!(:salutation)
    @state = open_struct.try!(:state)
    @street = open_struct.try!(:street)
    @street_addon = open_struct.try!(:street_addon)
    @zip_code = open_struct.try!(:zipcode)
    
    self.freeze
  end
end