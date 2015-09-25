module ApiHelper
    def current_api_user!
        if env['HTTP_TOKEN']
            User.find_by({token: env['HTTP_TOKEN']})
        else
            halt 401
        end
    end
end
