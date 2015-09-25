require 'bundler'
Bundler.require()


#Models
require './models/user'
require './models/list_entry'

#Helpers
require './helpers/session_helper'
require './helpers/api_helper'

#Controllers
require './controllers/application_controller'
require './controllers/welcome_controller'
require './controllers/users_controller'
require './controllers/sessions_controller'
require './controllers/api/api_controller'
require './controllers/api/list_entries_controller'



#Routes
map('/users'){run UsersController }
map('/sessions'){ run SessionsController }
map('/api/list_entries'){ run ListEntriesController }
map('/'){ run WelcomeController }
