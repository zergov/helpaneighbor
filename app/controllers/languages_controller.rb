class LanguagesController < ApplicationController
  skip_before_action :set_locale

  def index
    if params[:locale]
      cookies[:locale] = { value: params[:locale], expires: 1.month }
      redirect_to :homepage
    end
  end
end
