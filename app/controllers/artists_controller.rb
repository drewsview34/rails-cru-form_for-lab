class ArtistsController < ApplicationController

    def index
        @artist = Artist.all
    end

    def show
        find_artist
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.create(strong_params(:name, :bio))
        redirects_artist
    end

    def edit
        find_artist
    end

    def update
        find_artist
        @artist.update(strong_params(:name, :bio))
        redirects_artist
    end

    def find_artist
        @artist = Artist.find(params[:id])
    end

    private

    def strong_params(*args)
        params.require(:artist).permit(*args)
    end

    def redirects_artist
        redirect_to artist_path(@artist)
    end

end
