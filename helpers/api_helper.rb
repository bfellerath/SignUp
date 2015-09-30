module ApiHelper
    def current_api_user!
        if env['HTTP_TOKEN']
            user = User.find_by({token: env['HTTP_TOKEN']})
            if session[:is_admin]
                user.is_admin = true
            end
            user
        else
            halt 401
        end
    end
end
