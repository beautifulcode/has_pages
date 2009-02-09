class PagesController < ApplicationController
  
  layout :determine_layout
  
  # Last Resort For Page = Static Page view
  def method_missing(method)
    render :template => '/pages/'+params[:path].join('/'), :use_layout => true if params[:path]
    cache_page
  end
  
  # Will Rescue Errors like 404
  def rescue_action(exception)
    @exception = exception
    render :template => 'errors/404', :layout => 'errors'
  end
  
  protected
  
    # Runs down the path (from end to start) looking for layout file
    def determine_layout 
        params[:path].reverse.each do |segment|
          @alternate_layout ||= segment if File.exist?(RAILS_ROOT+'/app/views/layouts/'+segment+'.html.haml')
          @alternate_layout ||= segment if File.exist?(RAILS_ROOT+'/app/views/layouts/'+segment+'.html.erb')
        end
        @alternate_layout.to_s || 'application'
    end

end
