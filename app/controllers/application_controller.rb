class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def hello_world
  	# render html: "<html><head><title>Title Works</title></head><body>Hello World</body></html>".html_safe
  	@name = "Arjun"
  end

end
