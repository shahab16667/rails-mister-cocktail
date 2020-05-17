class DosesController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.after_save
      redirect_to cocktail_path(@cocktail)
    else
        @review = Review
        render 'cocktails/show'
    end
  end
end
