class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "doses/new"
    end

  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end


  private
  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
  def list_cocktails
    @cocktails = Cocktail.all
  end
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)

  end
end
