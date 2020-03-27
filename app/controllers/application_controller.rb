class ApplicationController < ActionController::Base
  before_action :set_visitor_cookie, unless: -> { cookies["visitor_token"] }

  def set_visitor_cookie
    cookies["visitor_token"] = SecureRandom.uuid
  end
end
