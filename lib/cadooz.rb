require 'json'
require 'money'
require 'ostruct'
require 'savon'
require 'active_support/all'

module Cadooz
  class Configuration
    attr_accessor :username, :password, :wsdl, :generation_profile

    TESTING_CONFIGURATION = YAML.load_file(File.join(File.dirname(__FILE__),'../config/sandbox.yml'))

    def initialize(username:, password:, wsdl_url:, generation_profile:)
      self.username = username || TESTING_CONFIGURATION['user_name']
      self.password = password || TESTING_CONFIGURATION['password']
      self.wsdl = wsdl_url || TESTING_CONFIGURATION['wsdl']
      self.generation_profile = generation_profile || TESTING_CONFIGURATION['generation_profile']
    end
  end

  def self.configuration
    @configuration ||= Configuration.new(
      username: nil,
      password: nil,
      wsdl_url: nil,
      generation_profile: nil)
  end

  def self.configure
    yield(configuration) if block_given?
  end

  module Immutable end
  module Mutable end
end

require_relative 'mixins'
require_relative 'cadooz/models/error'
require_relative 'cadooz/models/immutable/address'
require_relative 'cadooz/models/immutable/attributes'
require_relative 'cadooz/models/immutable/catalog'
require_relative 'cadooz/models/immutable/catalog_product'
require_relative 'cadooz/models/immutable/catalog_product_variation'
require_relative 'cadooz/models/immutable/generation_profile_product'
require_relative 'cadooz/models/immutable/greeting_card'
require_relative 'cadooz/models/immutable/invoice_information'
require_relative 'cadooz/models/immutable/order'
require_relative 'cadooz/models/immutable/order_position'
require_relative 'cadooz/models/immutable/order_status'
require_relative 'cadooz/models/immutable/payment'
require_relative 'cadooz/models/immutable/product_category'
require_relative 'cadooz/models/immutable/voucher'
require_relative 'cadooz/models/mutable/address'
require_relative 'cadooz/models/mutable/greeting_card'
require_relative 'cadooz/models/mutable/invoice_information'
require_relative 'cadooz/models/mutable/order'
require_relative 'cadooz/models/mutable/order_position'
require_relative 'cadooz/services/business_order_service'