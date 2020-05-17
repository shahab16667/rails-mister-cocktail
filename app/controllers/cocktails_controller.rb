class CocktailsController < ApplicationController
    def index 
      @cocktails = Cocktail.all
    end

    def show 
        @cocktails = Cocktail.find(params[:id])
        @dose = Dose.new
        @review = Review.new
    end

    def new
        @cocktails = Cocktail.new
    end

    def create 
        @cocktails = Cocktail.new(cocktail_params)
        if @cocktails.save
            redirect_to cocktail_path(@cocktails)
        else
            render 'new'
        end
    end

    private

    def cocktail_params
        params.require(:cocktail).permit(:name, :photo)
    end
end
