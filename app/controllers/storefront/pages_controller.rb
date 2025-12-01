class Storefront::PagesController < ApplicationController
  def show
    @page = Page.active.find_by!(slug: params[:slug])
  end
end
