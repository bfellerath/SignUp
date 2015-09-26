module SessionHelper

    def authenticate!
        unless current_user
            redirect '/'
        end
    end


    def current_user
        if session[:user_id]
            user = User.find(session[:user_id])
            if session[:is_admin]
                user.is_admin = true
            end
            user

        end

    end


end
