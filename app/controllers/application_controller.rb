class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #make sure we can use the basket in view as well as the controller
  helper_method :basket

  #because the basket  is everywhere on the site
  # eg you want a basket on product page or order page
  # we put it here

  def basket
  	#if user doesnt have a basket
  	# give them an empty one
  	if session[:basket].nil?
  		#basket is empty list of things
  		#using set bcoz we dont want to add same thing twice
  		session[:basket]= Set.new

  	end
  	# actually give them the basket
  	session[:basket]

  end

  # to use it in the views
  helper_method :current_user
  
  def current_user
    if session[:user_id].present?
      User.find(session[:user_id])
    end
  end
end
