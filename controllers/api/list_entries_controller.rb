class ListEntriesController < ApiController


    def listEntryParams
        @list_entry_params = @list_entry_params || JSON.parse(request.body.read.to_s)
    end

    get '/' do
        content_type :json
        # I don't want all the list_entries, I just want
        # the ones of the user
        # ListEntry.all.to_json
        # the below code is for user authentication
        current_api_user!.list_entries.to_json
    end

    post '/' do
        content_type :json
        # list_entry = ListEntry.create( params[:list_entry] || listEntryParams)
        # the below code is for user authentication
        list_entry = current_api_user!.list_entries.create( params[:list_entry] || listEntryParams )
        list_entry.to_json

    end

    delete '/:id' do
        content_type :json
        if current_api_user!.admin?
            current_api_user!.list_entries.destroy(params[:id])
        else
            return
        end
        halt 202

    end

end
