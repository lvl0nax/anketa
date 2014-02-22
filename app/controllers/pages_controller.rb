class PagesController < ApplicationController
  layout 'start_page', only: [:welcome]

  def show
    @page = Page.find(params[:id])
  end

  def welcome
    @page = Page.order(:id).first
  end

  def customer_type

  end

  def set_customer_type

  end
end
