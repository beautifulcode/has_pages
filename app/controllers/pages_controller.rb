class PagesController < ApplicationController
  
  layout :determine_layout
  
  # Last Resort For Page = Static Page view
  def method_missing(method)
    page_path = params[:path].join('/')
    page_path = 'index' if page_path.blank?
    render :template => "pages/#{page_path}"
    cache_page
  end
  
  # Will Rescue Errors like 404/500
  def rescue_action(exception)
    @exception = exception
    if @exception.class == ActionView::MissingTemplate
      render :template => 'errors/404', :layout => 'errors' 
    else
      # render :template => 'errors/500', :layout => 'errors'
      # Allow the default rails error. It is much more helpful.
    end
  end
  
  protected  
  
    # Runs down the path (from end to start) looking for layout file
    def determine_layout
        if params[:path].empty?
          @page_layout = 'home' if File.exist?(RAILS_ROOT+'/app/views/layouts/home.html.haml')
          @page_layout = 'home' if File.exist?(RAILS_ROOT+'/app/views/layouts/home.html.erb')
        else
          params[:path].reverse.each do |segment|
            @alternate_layout = segment if File.exist?(RAILS_ROOT+'/app/views/layouts/'+segment+'.html.haml')
            @alternate_layout = segment if File.exist?(RAILS_ROOT+'/app/views/layouts/'+segment+'.html.erb')
          end
          @page_layout = @alternate_layout
        end
        @page_layout || 'application'
    end

end
