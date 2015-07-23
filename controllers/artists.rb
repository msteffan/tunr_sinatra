#index route (REST)
get '/artists' do
    @artists = Artist.all
    erb :"artists/index"
end

get '/artist/:id' do
    @artist = Artist.find(params[:id])
    @songs = @artist.songs
    erb :"artists/show"
end

get '/artists/:id/edit' do
    
end
