class ArtistsController < ApplicationController

    def index

    end

    def show

        @artist = Artist.find(params[:id])

    end

    def new

    end

    def create

    end

    def edit

    end

    def update

    end

end
