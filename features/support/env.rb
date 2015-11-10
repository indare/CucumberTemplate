# coding: utf-8

require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'capybara/rspec'
require 'rspec'
require 'nokogiri'

# Capybara の初期設定
Capybara.app = 'http://www.yahoo.co.jp'
Capybara.app_host = 'http://www.yahoo.co.jp'
Capybara.run_server = false

# Poltergeistの設定
Capybara.register_driver :poltergeist do |app|
  options = {
      debug: false,
      js_errors: false,
      inspector: true,
      timeout: 20,
      phantomjs_options: %w(--ignore-ssl-errors=yes --web-security=no)
  }

  if ENV['http_proxy']
    options[:phantomjs_options].push('--proxy=' + ENV['http_proxy'])
  end

  Capybara::Poltergeist::Driver.new(app, options)
end

# 基本はPoltergeistでテストをする
Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist
