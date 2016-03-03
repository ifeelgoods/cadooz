class Cadooz::Immutable::CatalogProduct
  include Mixins

  attr_reader :attributes, :categories, :mobile_shippable, :name, :number, :offline_shippable, :online_shippable, :type, :variations

  def initialize(open_struct)
    @attributes = Array(open_struct.try!(:attributes)).try!(:each_with_object, []) { |a, arr| arr << Cadooz::Immutable::Attributes.new(a) }
    @categories = Array(open_struct.try!(:categories)).try!(:each_with_object, []) { |c, arr| arr << Cadooz::Immutable::ProductCategory.new(c) }
    @mobile_shippable = open_struct.try!(:mobile_shippable)
    @name = open_struct.try!(:name)
    @number = open_struct.try!(:number)
    @offline_shippable = open_struct.try!(:offline_shippable)
    @online_shippable = open_struct.try!(:online_shippable)
    @type = open_struct.try!(:type)
    @variations = Array(open_struct.try!(:variations)).try!(:each_with_object, []) { |v, arr| arr << Cadooz::Immutable::CatalogProductVariation.new(v) }

    self.freeze
  end
end