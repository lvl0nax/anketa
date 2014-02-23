class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_pages

  def find_pages
    @pages = Page.order(:id).all
  end
end
