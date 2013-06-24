require "turnip/capybara"
Dir["spec/steps/**/*.rb"].each { |f| require File.expand_path(f) }

RSpec.configure { |c| c.include UserSteps }

