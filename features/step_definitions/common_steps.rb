Given(/^I am on the "([^"]*)" page$/) do |page|
  case page.downcase
  when 'dresses'
      page.verify_page
  when 'home'
    on_page(HomePage).verify_page

  when 'shopping cart summary'
    on_page(ShoppingCartSummaryPage).verify_page
  end
end


When(/^I select the "([^"]*)" link$/) do |section|
  case section.downcase
  when 'dresses'
    on_page(HomePage).dresses_link_element.click
    on_page(DressesPage).verify_page
  end
end

When(/^I select the logo image$/) do
  on_page(HomePage).home_link
end

