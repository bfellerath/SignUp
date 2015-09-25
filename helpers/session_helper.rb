module SessionHelper

    def authenticate!
        unless current_user
            redirect '/'
        end
    end


    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        end

    end


end
