class Cadooz::Immutable::Catalog
  include Mixins

  attr_reader :id, :name, :description, :products

  def initialize(open_struct)
    @id = open_struct.try!(:id)
    @name = open_struct.try!(:name)
    @description = open_struct.try!(:description)
    @products = Array(open_struct.try!(:products)).try!(:each_with_object, []) { |p, arr| arr << Cadooz::Immutable::CatalogProduct.new(p) }
    self.freeze
  end
end