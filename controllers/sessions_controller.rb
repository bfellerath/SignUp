class SessionsController < ApplicationController

    post '/' do # Attempt to sign in
        user = User.find_by({username: params[:username]})

        password_attempt = params[:password]
        if user && user.password==password_attempt
            session[:user_id] = user.id

            if params[:admin]=="on"
                session[:is_admin] = true

            else
                session[:is_admin] = false
            end
        
            redirect '/users/profile'
        else
            redirect '/'
        end

    end



    delete '/' do
        session[:user_id] = nil
        redirect '/'
    end

end
