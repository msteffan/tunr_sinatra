#index
get '/playlists' do
  @playlists = Playlist.all
  erb :"playlists/index"
end

#new playlist
get '/playlists/new' do
    erb :"playlists/new"

end

post '/playlists' do
    new_playlist = Playlist.create(params[:playlist])
    redirect "/playlists/#{new_playlist.id}"
end


#add song to playlist

get "/playlists/:id/add" do
    @playlist = Playlist.find(params[:id])
    erb :"playlists/add"
end

put "/playlists/:id/add" do
    @playlist = Playlist.find(params[:id])
    @playlist.songs << Song.find(params[:song_id])
    redirect "/playlists/#{@playlist.id}"
end


#show
get '/playlists/:id' do
    @playlist = Playlist.find(params[:id])

    erb :"playlists/show"

end
