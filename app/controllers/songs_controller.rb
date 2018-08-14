class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.new(name: params[:song][:name])
    @song.artist = Artist.find_or_create_by(params[:artist])

    params[:genres].map { |k, v| v }.each do|genre|
      @song.genres << Genre.create(genre)
    end

    if @song.save
      flash[:message] = "Successfully created song."
      redirect "/songs/#{@song.slug}"
    end
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(params[:artist])
    @song.update(params[:song])
    @song.genres = []

    params[:genres].map { |k, v| v }.each do |genre|
      @song.genres << Genre.find_or_create_by(genre)
    end
    if @song.save
      flash[:message] = "Successfully updated song."
      redirect "/songs/#{@song.slug}"
    end
  end
end
