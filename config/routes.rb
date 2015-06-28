ActionController::Routing::Routes.draw do |map|

  map.connect '*path', :controller => 'pages', :action => 'static'

end
