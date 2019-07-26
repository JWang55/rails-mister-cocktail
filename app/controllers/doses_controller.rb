class DosesController < ApplicationController
before_action :find_cocktail
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "doses/new"
    end

  end

  def destroy

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
