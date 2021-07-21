class GenresController < ApplicationController

    def index
        @genre = Genre.all
    end

    def show
        find_genre
    end

    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.create(strong_params(:name))
        redirects_genre
    end

    def edit
        find_genre
    end

    def update
        find_genre
        @genre.update(strong_params(:name))
        redirects_genre
    end

    def find_genre
        @genre = Genre.find(params[:id])
    end

    private

    def strong_params(*args)
        params.require(:genre).permit(*args)
    end

    def redirects_genre
        redirect_to genre_path(@genre)
    end

end
