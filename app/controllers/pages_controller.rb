class PagesController < ApplicationController

  def method_missing(method)
    render :template => '/pages/'+params[:path].join('/'), :use_layout => true if params[:path]
    cache_page
  end

end
