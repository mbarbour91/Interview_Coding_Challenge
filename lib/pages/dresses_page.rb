class DressesPage < BasePage

  page_url 'http://automationpractice.com/index.php?id_category=8'

  link(:checkout_button, xpath: "//a[@title='Proceed to checkout']")
  list_items(:results, xpath: "//li[contains(@class, 'ajax_block_product')]")
  spans(:availability, class: 'available-now')
  span(:add_to_cart_button, text: 'Add to cart', index: 0)
  span(:continue_shopping_button, xpath: "//span[@title='Continue shopping']//span")



  def all_dresses_available?
    results_elements.length == availability_elements.length
  end

  def add_first_dress_to_cart
    dress_name_elems = @browser.find_elements(:xpath, "//li[contains(@class,'first-in-line') and contains(@class, 'first-item-of-tablet-line')]//a[@class='product-name']")
    dress_name = dress_name_elems.first.attribute(:title)
    add_to_cart_button_element.click
    continue_shopping_button_element.click
    dress_name
  end

  def filter_by_colors(colors)
    color_filter_ids = YAML::load_file(File.join(__dir__, '../../config/data/colors_reference.yml'))
    colors.downcase.gsub(" ", "").split(',').each do |color|
      @browser.find_element(:id, "layered_id_attribute_group_#{color_filter_ids[color]}").click
      #gives time for url to change
      sleep 1
    end
  end

  def colors_correct?(expected_colors)
    expected_colors.downcase.gsub(" ", "").split(',').each do |color|
      fail("Current filter does not contain #{color}") unless @browser.current_url.include? color
    end
  end
end