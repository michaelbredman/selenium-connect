#selenium-server
===============

This library aims to make configuring and running your Selenium tests against a Selenium Server simple for both local and remote execution.


## Getting Started
```ruby
require 'selenium-server'

SeleniumServer.configure do |c|
  c.host         = "localhost"
  c.port         = "4444"
  c.browser      = "firefox"
  c.profile_path = "#{Dir.pwd}/profiles/your_custom_firefox_profile"
end

@driver = SeleniumServer.start

@driver.get "http://www.google.com"

SeleniumServer.finish
```  

## Helpful bits

### Selenium Actions Reference  
This library uses the Selenium WebDriver Remote Bridge actions. You can find them [here](http://www.ruby-doc.org/gems/docs/b/bbc-selenium-webdriver-1.17.0/Selenium/WebDriver/Remote/Bridge.html).  

### Start  
If host is set to "localhost", it will download the latest selenium-standalone-server.jar (unless it already has) and run it. If no additional parameters are set, it will be exected in the background, with logging disabled. This functionality is driven using the [Selenium Rake Server Task](http://selenium.googlecode.com/svn/trunk/docs/api/rb/Selenium/Rake/ServerTask.html).

### Finish  
Issues a quit command to the driver (and stops the local server if your host is set to "localhost").  

### Support  
Currently, Firefox is is all that is supported. More coming soon!  

### Versioning  
This project loosely follows [Semantic Versioning](http://semver.org/).
