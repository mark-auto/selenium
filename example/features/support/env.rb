require 'capybara/cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'headless'
require 'pry'
require 'site_prism'
require 'redis'
require 'inifile'
require 'require_all'
require 'fig_newton'
require 'sequel'
require 'date'
require 'rails_helper'
require 'chromedriver-helper'
require 'csv'
require 'uri'
require 'yaml'
require 'base64'
require 'date'

require_all 'lib'

Dir.mkdir('report/') unless Dir.exist?('report/')
Dir.mkdir('screenshots/') unless Dir.exist?('screenshots/')

# clean up the screenshots folder
FileUtils.rm_r Dir.glob('screenshots/*')
FileUtils.rm_r Dir.glob('report/*')
FileUtils.rm_r Dir.glob('data/downloads/*')

system 'clear'

if ENV['FIG_NEWTON_FILE'].nil?
  fail('Please specify which environment you wish to test in the following format: FIG_NEWTON_FILE=cert.yml')
end
