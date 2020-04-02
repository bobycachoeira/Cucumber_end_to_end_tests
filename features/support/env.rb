require 'capybara'
require 'capybara/cucumber'
require "selenium-webdriver"

require_relative 'helper.rb'
require_relative 'spec_helper.rb'

World Capybara::DSL
BROWSER = ENV['BROWSER']
ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE']




##Registrar driver do chrome remoto

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app,
    :browser => :remote,
    :desired_capabilities => :chrome,
    :url => "http://selenium-hub:4444/wd/hub"
  )
end


######## Chrome
Capybara.register_driver :chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {
      args: %w[ no-sandbox disable-gpu window-size=1280,1024]
    }
    )

  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end


###Chrome Headless
Capybara.register_driver :chrome_headless do |app|
  caps = Selenium::WebDriver::Remote::Capabilities.chrome(loggingPrefs: { browser: 'ALL' })
  opts = Selenium::WebDriver::Chrome::Options.new

  chrome_args = %w[--headless --window-size=1920,1080 --disable-gpu --no-sandbox --disable-dev-shm-usage]
  chrome_args.each { |arg| opts.add_argument(arg) }

  ##opts.add_argument('log-level=' + LOGLEVEL.to_s)
  
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: opts, desired_capabilities: caps)
end


## Cucumber Definitions
Before do |feature|
    ## configure the chosen browser
    Capybara.configure do |capybara|
      #Define o browser utilizado no teste
      if BROWSER.eql?('remote')
        Capybara.default_driver = :selenium_chrome
      elsif BROWSER.eql?('chrome_headless')
        Capybara.default_driver = :chrome_headless
      else
        capybara.default_driver = :chrome
      end

        #define o ambiente a ser testado
        capybara.app_host = 'http://automationpractice.com'
      end
  
    ## set default max wait
    Capybara.reset_sessions!
    Capybara.default_max_wait_time = 30
  end


  After do |scenario|
    ## take screenshot
    scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')
    if scenario.passed?
      take_screenshot(scenario_name, 'passed')
    else
      take_screenshot(scenario_name, 'failed')
    end
    ## kills instance when not headless
      Capybara.current_session.driver.quit
  end