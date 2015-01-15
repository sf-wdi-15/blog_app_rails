module SessionsHelper

  # takes in a user object
  def login(user)
    # stores their id in a session
    session[:user_id] = user.id
    # stores the user in an instance variable
    @current_user = user
  end

  def logout
    # set @current_user and session to nil
    #   this effectively forgets the user
    @current_user = nil
    session[:user_id] = nil
  end


  def logged_in?
    if current_user == nil
      redirect_to "/login"
    end
  end

  def current_user
    if session[:user_id] == nil
      @current_user = nil
    else
      @current_user = @current_user || User.find_by(id: session[:user_id])
    end
  end

end
