class SongsController < ApplicationController

  def new
    @song = Song.new(params[:id])
  end

  def index
    @song = Song.all
  end

  def show
    @song = Song.find(params[:id])

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(song_params)

    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to song_url
  end

  private

  def song_params(args*)
    params.permit(:title, :genre, :artist_name, :release_year)
  end
end
