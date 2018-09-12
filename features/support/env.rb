require 'page-object'
require 'require_all'

require_all 'lib/pages/*.rb'

World PageObject::PageFactory


HOME_URL = 'http://automationpractice.com'

BROWSER = 'chrome'
