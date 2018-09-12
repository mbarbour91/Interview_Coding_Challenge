class BasePage
  include PageObject
  button(:search_button, name: 'submit_search')
  link(:home_link, title: 'My Store')
  link(:shopping_cart, title: 'View my shopping cart')
  link(:check_out, title: 'Check out')
  link(:dresses_link, text: 'Dresses', index: 1)
  link(:remove_first_item_from_cart_link, class: 'ajax_cart_block_remove_link', index: 0)
  link(:check_out_button, id: 'button_order_cart')
  span(:cart_empty, class: 'ajax_cart_no_product')
  text_field(:search_text, id: 'search_query_top')



  def verify_page
    @browser.current_url.include? self.page_source
  end

  # verifies each item in the cart
  # @param item first item in cart
  def verify_first_cart_item(item)
    shopping_cart_element.hover
    first_item = @browser.find_element(:xpath, "//div[@class='cart_block_list']//dt[contains(@class,'first_item')]//a[@class='cart_block_product_name']")
    fail('Unexpected item in first slot of cart') unless first_item.attribute('title').eql? item
  end

  def cart_empty?
   sleep 5
   fail('Cart not empty') unless cart_empty_element.present?
  end

  def check_out
    shopping_cart_element.hover
    check_out_button_element.click
  end

end