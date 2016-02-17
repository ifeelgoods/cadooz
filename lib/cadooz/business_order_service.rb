class Cadooz::BusinessOrderService
  DEFAULT_TIMEOUT = 10
  DEFAULT_GENERATION_PROFILE = 'XML Schnittstelle (Test)'

  def initialize(open_timeout, read_timeout)
    @client = Savon.client(
      wsdl: Cadooz.configuration.wsdl,
      basic_auth: [
          Cadooz.configuration.username,
          Cadooz.configuration.password
      ],
      headers: { 'SOAPAction' => '' },
      open_timeout: open_timeout || DEFAULT_TIMEOUT,
      read_timeout: read_timeout || DEFAULT_TIMEOUT
    )

    @call = -> o, m { m ? @client.call(o, message: m) : @client.call(o) }
  end

  # Returns informations about an order.
  # Returns:
  # The order result object contains informations about the created order.
  def get_order_status(order_number)
    response_class = Cadooz::OrderStatus

    deserialize(@call.(__callee__, {order_number: order_number}), response_class, __callee__)
  end

  # Returns informations about an order based on the customer order reference number given during createOrder(Order) in the field CustomerReferenceNumber.
  # Returns:
  # The order result object contains informations about the created order.
  def get_order_status_by_customer_reference_number(customer_reference_number)
    response_class = Cadooz::OrderStatus

    deserialize(@call.(__callee__, {customer_reference_number: customer_reference_number}), response_class, __callee__)
  end

  # Returns informations about changes in one of the created order since the lastCheckTime. You should use this task to get changes in orders. Use the lastCheckTime to reduce the data size and the response time for the needed informations. For example: You have created an order on 01.01.2013. In the best situation you will get between 1-3 days later new change states because the order is delivered. If the order returns after a week, you will receive a new change state. Be aware, that you store your "lastCheckTime" on first request and use it next time. All changes since that time are returned.
  # Returns:
  # A list of of order result object containing informations about changed orders.
  def get_changed_orders(last_check_time)
    response_class = Cadooz::OrderStatus

    deserialize(@call.(__callee__, {last_check_time: last_check_time}), response_class, __callee__)
  end

  # Returns a list of catalog's for the authenticated user. If an error occurs or the user is not allowed to query any catalog, an empty list will be returned.
  # Parameters:
  # includeExtraContent - If true, then some extra content is not included (like attributes and categories)
  # Returns:
  # A list of all available catalog id's for context-principal or an empty List.
  def get_available_catalogs(include_extra_content = false)
    response_class = Cadooz::Catalog

    deserialize(@call.(__callee__, {include_extra_content: include_extra_content }), response_class, __callee__)
  end

  # Returns a List of ProductCategory objects for CatalogProduct objects or an empty list if an error occurs.
  # Returns:
  # A list of all categories or an empty list.z
  def get_available_categories
    response_class = Cadooz::ProductCategory

    deserialize(@call.(__callee__, nil), response_class, __callee__)
  end

  # Returns a list of products that can be used within a order. This is specific for a generation profile and should not be mixed up with the merchant catalog getAvailableCatalogs(boolean).
  # Parameters:
  # generationProfile - a name of a generation profile defined by cadooz
  # Returns:
  # A list of generation profile products that can be used for an order inside createOrder(Order)
  def get_available_products(generation_profile = DEFAULT_GENERATION_PROFILE)
    response_class = Cadooz::GenerationProfileProduct

    deserialize(@call.(__callee__, {generation_profile: generation_profile }), response_class, __callee__)
  end

  private

  def deserialize(response, response_class, operation)
    key = (operation.to_s + '_response').to_sym
    body = response.body[key][:return]

    object = JSON.parse(body.to_json, object_class: OpenStruct)

    binding.pry

    if object.class == Array
      object.each_with_object([]) { |o, arr| arr << Object::const_get(response_class.to_s).new(o) }
    elsif object.class == OpenStruct
      Object::const_get(response_class.to_s).new(object)
    else
      # TODO handle exception
    end
  end
end