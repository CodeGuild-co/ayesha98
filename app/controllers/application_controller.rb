class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :init
	

  def init
    @posts = Dir.entries('app/views/posts').keep_if{|path|
			path.ends_with? ".html.erb"
		}.map{|filename|
	  	y = YAML.load_file('app/views/posts/' + filename)
      y['filename'] = filename.sub('.html.erb', '')
	  	y
    }.sort_by{|p| p["date"]}
  end
end

