class DosesController < ApplicationController
  def create
    @cocktail = Cocktail.find[:cocktail_id]
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path
    else
      render 'cocktail/show'
    end
  end

  def destroy
  end

  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient)

  end
end
