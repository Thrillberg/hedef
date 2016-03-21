class ReportsController < ApplicationController
  require 'rest-client'

  def new

  end

  def create

  end

  def get_logs
    result = RestClient.get "#{Rails.application.secrets['mailgun_key']}"\
    "@api.mailgun.net/v3/erictillberg.com/events"
  end
end
