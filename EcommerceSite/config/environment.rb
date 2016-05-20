# Load the Rails application.
require File.expand_path('../application', __FILE__)
# Make sure you are loading CarrierWave after loading your ORM, otherwise you'll need to require the relevant extension manually
require 'carrierwave/orm/activerecord'
# Initialize the Rails application.
Rails.application.initialize!
