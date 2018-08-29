require 'test_helper'

class Admin::AccessoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_accessory = admin_accessories(:one)
  end

  test "should get index" do
    get admin_accessories_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_accessory_url
    assert_response :success
  end

  test "should create admin_accessory" do
    assert_difference('Admin::Accessory.count') do
      post admin_accessories_url, params: { admin_accessory: {  } }
    end

    assert_redirected_to admin_accessory_url(Admin::Accessory.last)
  end

  test "should show admin_accessory" do
    get admin_accessory_url(@admin_accessory)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_accessory_url(@admin_accessory)
    assert_response :success
  end

  test "should update admin_accessory" do
    patch admin_accessory_url(@admin_accessory), params: { admin_accessory: {  } }
    assert_redirected_to admin_accessory_url(@admin_accessory)
  end

  test "should destroy admin_accessory" do
    assert_difference('Admin::Accessory.count', -1) do
      delete admin_accessory_url(@admin_accessory)
    end

    assert_redirected_to admin_accessories_url
  end
end
