When(/^I add a "([^"]*)" to the shopping cart$/) do |product|
  @items_added_to_cart = []
  case product.downcase
  when 'dress'
    item = on_page(DressesPage).add_first_dress_to_cart
    @items_added_to_cart << item
  end
end


Then(/^The "([^"]*)" will appear in the cart$/) do |product|
  case product.downcase
  when 'dress'
    on_page(DressesPage).verify_first_cart_item @items_added_to_cart[0] unless @items_added_to_cart.empty?
  end
end

Given(/^I have a "([^"]*)" in the shopping cart$/) do |product|
  case product.downcase
  when 'dress'
    on_page(DressesPage).verify_first_cart_item @items_added_to_cart[0]
  end
end

When(/^I remove the first item from the cart$/) do
  on_page(HomePage).remove_first_item_from_cart_link_element.click
end

Then(/^The cart will be empty$/) do
  on_page(HomePage).cart_empty?
end

When(/^I choose to check out$/) do
  on_page(HomePage).check_out
end