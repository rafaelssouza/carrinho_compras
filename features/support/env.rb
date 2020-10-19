require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'capybara/rspec'
require_relative 'helper.rb'
require_relative 'page_helper.rb'
include Capybara::DSL

BROWSER = ENV['BROWSER']
AMBIENTE = ENV['AMBIENTE']

CONFIG = YAML.load_file(File.dirname(__FILE__)+"/ambientes/#{AMBIENTE}.yml")

World(Helper)
World(Pages)

caminho_path = caminho_path = "C:\\Dev\\geckodriver.exe"

Capybara.register_driver :selenium do |app|

if BROWSER.eql?('chrome')
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
    elsif BROWSER.eql?('firefox')
    Selenium::WebDriver::Firefox::Service.driver_path  = caminho_path
    Capybara::Selenium::Driver.new(app, :browser => :firefox, :marionette =>true)                             
    end
end

Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = CONFIG['url_padrao']
    config.default_max_wait_time = 10
end
