class CocktailsController < ApplicationController
  before_action :list_all
  def index
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render 'new'
    end
  end

  def show
    id = params[:id].to_i
    @cocktail = @cocktails.find(id)
  end

  private

  def list_all
    @cocktails = Cocktail.all
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

end
