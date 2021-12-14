require "test_helper"

class WineOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wine_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get wine_orders_show_url
    assert_response :success
  end
end
