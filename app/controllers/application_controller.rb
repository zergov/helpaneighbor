class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    redirect_to :choose_language unless available_locales.include?(cookies[:locale])
    I18n.locale = cookies[:locale]
  end

  private

  def available_locales
    Rails.application.config.available_locales
  end
end
