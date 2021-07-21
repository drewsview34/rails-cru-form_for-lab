class SongsController < ApplicationController

    def index
        @song = Song.all
    end

    def show
        find_song
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(strong_params(:name, :artist_id, :genre_id))
        redirects_song
    end

    def edit
        find_song
    end

    def update
        find_song
        @song.update(strong_params(:name, :artist_id, :genre_id))
        redirects_song
    end

    def find_song
        @song = Song.find(params[:id])
    end

    private

    def strong_params(*args)
        params.require(:song).permit(*args)
    end

    def redirects_song
        redirect_to song_path(@song)
    end

end
