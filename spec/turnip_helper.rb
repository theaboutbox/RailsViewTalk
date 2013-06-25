require "turnip/capybara"
Dir["spec/acceptance/steps/**/*.rb"].each { |f| require File.expand_path(f) }

RSpec.configure do |c| 
  c.include UserSteps
  c.include NonProfitSteps
  c.include EventSteps
end

