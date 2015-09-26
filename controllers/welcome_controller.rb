class WelcomeController < ApplicationController

    get '/' do
        erb :index
    end
    #
    # post '/api/list_entry' do
    #     content_type :json
    #     list_entry = ListEntry.create( params[:list_entry] || listEntryParams)
    #     # the below code is for user authentication
    #     list_entry = current_api_user!.list_entries.create( params[:list_entry] || listEntryParams )
    #     # list_entry.to_json
    #     # redirect '/'
    # end


end
