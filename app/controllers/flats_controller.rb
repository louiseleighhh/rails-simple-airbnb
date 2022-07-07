class FlatsController < ApplicationController
  before_action :find_flat, only: %i[show edit update destroy]

  # def search
  #   query = params[:query]
  #   @flats = Flat.where("name LIKE %#{query}%")
  # end

  def index
    query = params[:query]
    if params[:query].present?
      @flats = Flat.where("name LIKE ?", "%#{query}%")
    else
      @flats = Flat.all
    end
  end

  def show; end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit; end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :number_of_guests, :price_per_night, :picture_url)
  end
end
