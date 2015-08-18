require 'sinatra'
require './lib/diving/map.rb'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"
enable :sessions
set :session_secret, 'BADSECRET'

get '/' do
  session[:scene] = 'START'
  redirect to('/game')
end

get '/game' do
  scene = Map::load_scene(session)

  if scene
    erb :show_scene, :locals => {:scene => scene}
  else
    erb :you_died
  end
end


post '/game' do
  scene = Map::load_scene(session)
  action = params[:action]

  if scene
    next_scene = scene.go(action) || scene.go("*")

    if next_scene
      Map::save_scene(session, next_scene)
    end

    redirect to('/game')
  else
    erb :you_died
  end
end
