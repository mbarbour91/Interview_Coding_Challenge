require 'selenium-webdriver'
require 'page-object'



Before do
  b = ''
  case BROWSER.downcase
  when 'firefox'
    Selenium::WebDriver::Firefox.driver_path="drivers/geckodriver.exe"
    b = Selenium::WebDriver.for :firefox
  when 'ie'
    Selenium::WebDriver::IE.driver_path="drivers/IEDriverServer.exe"
    b = Selenium::WebDriver.for :ie
  when 'chrome'
    Selenium::WebDriver::Chrome.driver_path="drivers/chromedriver.exe"
    b = Selenium::WebDriver.for :chrome
  else
    fail('Invalid browser type. Check env file')
  end
  @browser = b
  @browser.get HOME_URL
end


After do
  @browser.quit
end