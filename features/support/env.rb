require 'cucumber'
require 'rspec'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'
require 'site_prism'
require 'rest-client'
require 'pry'
require 'rubocop'
require 'fileutils'
require 'cpf_faker'
require 'faker'
require 'timeout'
require_relative 'data.rb'
require_relative 'page_helper.rb'


ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE']

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :ie)
end

Capybara.default_driver = :selenium

Capybara.default_max_wait_time = 14

Capybara.page.driver.browser.manage.window.maximize

$env = (ENV['ENV'] || 'tc_hml_raia')
puts 'Programa executado no ambiente - ' + $env

if $env == 'tc_hml_raia'
  $url_tc_hml = 'http://192.1.1.124:8080/'
elsif $env == 'tc_hml_drogasil'
  $url_tc_hml = ''
end

World(Capybara::DSL)
World(DataLoad)
World(Pages)
