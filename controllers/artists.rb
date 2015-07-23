#index route (REST)
get '/artists' do
    @artists = Artist.all
    erb :"artists/index"
end

#new route
get '/artists/new' do
    erb :"artists/new"
end

#show route
get '/artists/:id' do
    @artist = Artist.find(params[:id])
    @songs = @artist.songs
    erb :"artists/show"
end

#new route
post "/artists" do
    new_artist = Artist.create(name: params[:name],
                nationality: params[:nationality],
                photo_url: params[:photo_url])
    redirect "/artists/#{new_artist.id}"
end


#update route
get '/artists/:id/edit' do
    @artist = Artist.find(params[:id])
    erb :"artists/edit"
end

put "/artists/:id" do
    @artist = Artist.find(params[:artist])
    @artist.update(params[:artist])
    redirect "/artists/#{@artist.id}"
end

#delete route
delete "/artists/:id" do
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect "/artists"
end
