Then(/^All available "([^"]*)" are displayed$/) do |product|
  case product.downcase
  when 'dresses'
    fail('Dresses were not all available') unless on_page(DressesPage).all_dresses_available?
  end
end

When(/^I filter dresses by the color\(s\) "([^"]*)"$/) do |colors|
  on_page(DressesPage).filter_by_colors(colors)
end

Then(/^I see only "([^"]*)" dresses are displayed$/) do |colors|
  on_page(DressesPage).colors_correct?(colors)
end