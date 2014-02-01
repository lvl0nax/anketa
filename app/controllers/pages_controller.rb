class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
  end

  def welcome; end

  def customer_type

  end

  def set_customer_type

  end
end
