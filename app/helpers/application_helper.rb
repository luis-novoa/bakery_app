module ApplicationHelper
  def user_utilities
    if user_signed_in?
      link_to('Edit Your Info', edit_user_registration_path) +
      link_to('Log Out', destroy_user_session_path)
    else
      link_to('Sign Up', new_user_registration_path) +
      link_to('Log In', new_user_session_path)
    end
  end
  
end
