class ApplicationController < ActionController::Base
    before_action :set_cache_headers
  
    def set_cache_headers
      response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
      response.headers["Pragma"] = "no-cache"
      response.headers["Expires"] = "0"
    end

end
