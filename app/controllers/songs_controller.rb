require 'rack-flash'

class SongsController < ApplicationController
   use Rack::Flash

  get "/songs" do
    @songs = Song.all
    erb :"songs/index"
  end

  get "/songs/new" do
    erb :"songs/new"
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  post "/songs" do
    @song = Song.create(params[:song])
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/edit"
  end

  patch "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
