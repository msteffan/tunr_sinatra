#index route (REST)

get '/songs' do
    @songs = Song.all
    erb :"songs/index"
end

#new route
get '/songs/new' do
    erb :"songs/new"
end

post "/songs" do
    new_song = Song.create(title: params[:title],
                album: params[:album],
                preview_url: params[:preview_url],
                artist_id: params[:artist_id])
    redirect "/songs/#{new_song.id}"
end

# show route

get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :"songs/show"
end


#update route
get '/songs/:id/edit' do
    @song = Song.find(params[:id])
    erb :"songs/edit"
end

put '/songs/:id' do
    @song = Song.find(params[:id])
    @song.update(params[:song])
    redirect "/songs/#{@song.id}"
end

#delete route
delete '/songs/:id' do
    @song = Song.find(params[:id])
    @song.destroy
    redirect '/songs'
end
