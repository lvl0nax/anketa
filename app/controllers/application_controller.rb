class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_pages

  def find_pages
    @pages_all = Page.order(:id).all
  end
end
