Capybara.configure do |config|
  config.run_server = false
  config.default_driver = if ENV['BROWSER'] == 'headless'
                            :headless
                          elsif ENV['BROWSER'] == 'firefox'
                            :firefox
                          else
                            :chrome
                          end
  config.default_max_wait_time = 10
  config.ignore_hidden_elements = false
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

Capybara.register_driver :headless do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

# Capybara.register_driver :chrome do |app|
#   profile = Selenium::WebDriver::Chrome::Profile.new
#   profile["download.default_directory"] = "#{FileUtils.pwd}/data/downloads"
#   args = ["--start-maximized"]
#   Capybara::Selenium::Driver.new(app,
#                                  browser: :chrome,
#                                  :profile => profile,
#                                  :args => args)
# end

# Capybara.register_driver :headless_chrome do |app|
#   profile = Selenium::WebDriver::Chrome::Profile.new
#   profile["download.default_directory"] = "#{FileUtils.pwd}/data/downloads"
#   args = ["--window-size=1920,1080", "--headless"]
#   Capybara::Selenium::Driver.new(app,
#                                  browser: :chrome,
#                                  :profile => profile,
#                                  :args => args)
# end

# Capybara.register_driver :firefox do |app|
#   profile = Selenium::WebDriver::Firefox::Profile.new
#   profile['browser.download.dir'] = "#{FileUtils.pwd}/data/downloads"
#   profile['browser.download.folderList'] = 2
#   profile['browser.helperApps.neverAsk.saveToDisk'] = "multipart/form-data, text/css, text/html, text/xml, text/csv, text/plain"
#   profile['pdfjs.disabled'] = true
#   Capybara::Selenium::Driver.new(app,
#                                  browser: :firefox,
#                                  profile: profile)
# end
