require 'test_helper'

class PorkersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get porkers_new_url
    assert_response :success
  end

  test "should get show" do
    get porkers_show_url
    assert_response :success
  end

end
