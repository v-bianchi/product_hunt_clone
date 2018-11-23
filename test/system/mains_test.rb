require "application_system_test_case"

class MainsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_path

    assert_selector "h1", text: "Awesome Products"
  end

  test "ckeck if all products are displayed in index" do
    visit root_path

    assert_selector ".product-body", count: Product.count
  end

  test "logged in user is able to create a new product" do
    login_as users(:georges)

    visit "/products/new"

    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"
    # save_and_open_screenshot

    click_on 'Create Product'

    # Should be redirected to Home with new product
    assert_equal root_path, page.current_path
    assert_text "Change your life: Learn to code"
  end

  test "user not logged in cannot create product"do
    visit "/products/new"

    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"

    click_on 'Create Product'

    # Should login error message
    save_and_open_screenshot
    assert_equal new_user_session_path, page.current_path
  end

end
