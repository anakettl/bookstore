Capybara.register_driver :chrome_headless do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    'goog:chromeOptions': {
      args: %w[ no-sandbox headless disable-gpu --window-size=1920,1080]
    }
  )
  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end

#Ensure Log directory exists
%x(mkdir -p tmp/selenium_logs)

Capybara.register_driver :chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    'goog:chromeOptions': { args: %w[ start-maximized ] }
  )

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: capabilities,
    driver_opts: {
      log_path: "./tmp/selenium_logs/selenium-#{Time.now.to_i}.log",
      verbose: true
    }
  )
end

Capybara.javascript_driver = ENV.fetch('CAPYBARA_JAVASCRIPT_DRIVER', :chrome_headless).to_sym

#must allow this URL if Webdrivers needs to download a binary
WebMock.disable_net_connect!(allow: 'chromedriver.storage.googleapis.com', allow_localhost: true)