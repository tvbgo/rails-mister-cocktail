class DosesController < ApplicationController
  before_action :find_dose, only: [:show, :destroy]

  def index
    @doses = Dose.all
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def show; end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail_id)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_dose
    @dose = Dose.find(params[:id])
  end
end
