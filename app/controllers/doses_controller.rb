class DosesController < ApplicationController
before_action :list_cocktails
  def new
    @cocktail = @cocktails.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create

  end

  def destroy

  end


  private
  def list_cocktails
    @cocktails = Cocktail.all
  end
  def dose_params
    params.require(:dose).permit(:description, :ingredient)

  end
end
