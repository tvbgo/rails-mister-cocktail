class CocktailsController < ApplicationController
  before_action :find_cocktail, only: %i[show edit update destroy]
  def index
    @cocktails = Cocktail.all
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def new
    @cocktail = Cocktail.new
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def show; end

  def edit
    @ingredients = Ingredient.all
    @ingredient = Ingredient.new
    @dose = Dose.new
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render 'edit'
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :dose, :ingredient, :photo)
  end

  def find_ingredient
    @ingredient = Ingredient.find(params[:ingredient])
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
