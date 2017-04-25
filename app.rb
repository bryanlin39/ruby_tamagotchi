require('sinatra')
require('sinatra/reloader')
require('./lib/tamagotchi')
also_reload('lib/**/*.rb')

get('/') do
  @name = 'name1' #form input
  Tamagotchi.new(@name)
  @tam_list = Tamagotchi.all()
  @food = @tam_list[@name].food()-@tam_list[@name].time_check()
  @rest = @tam_list[@name].rest()-@tam_list[@name].time_check()
  @activity = @tam_list[@name].activity()-@tam_list[@name].time_check()
  @alive = @tam_list[@name].alive()
  erb(:index)
end

post('/feed') do
  @name = 'name1'
  @tam_list = Tamagotchi.all()
  @tam_list[@name].feed()
  @food = @tam_list[@name].food()-@tam_list[@name].time_check()
  @rest = @tam_list[@name].rest()-@tam_list[@name].time_check()
  @activity = @tam_list[@name].activity()-@tam_list[@name].time_check()
  @alive = @tam_list[@name].alive()
  erb(:feed)
end

post('/play') do
  @name = 'name1'
  @tam_list = Tamagotchi.all()
  @tam_list[@name].play()
  @food = @tam_list[@name].food()-@tam_list[@name].time_check()
  @rest = @tam_list[@name].rest()-@tam_list[@name].time_check()
  @activity = @tam_list[@name].activity()-@tam_list[@name].time_check()
  @alive = @tam_list[@name].alive()
  erb(:play)
end

post('/refresh') do
  @name = 'name1'
  @tam_list = Tamagotchi.all()
  @tam_list[@name].refresh()
  @food = @tam_list[@name].food()-@tam_list[@name].time_check()
  @rest = @tam_list[@name].rest()-@tam_list[@name].time_check()
  @activity = @tam_list[@name].activity()-@tam_list[@name].time_check()
  @alive = @tam_list[@name].alive()
  erb(:refresh)
end
