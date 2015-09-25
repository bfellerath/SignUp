class UsersController < ApplicationController

    get '/new' do # sign up
        erb :'users/new'
    end

    post '/' do
        user = User.new(params[:user])
        user.password = params[:password]
        user.save
        redirect '/'
    end

    get '/login' do
        erb :'users/login'
    end

    get '/profile' do
        authenticate!
        @current_user = current_user
        erb :'users/profile'
    end



end
