class PetsController < ApplicationController
  def index
    @dogs = Pet.where(pet_type: "DOG")
    @cats = Pet.where(pet_type: "CAT")
    @snakes = Pet.where(pet_type: "SNAKE")
    @bugs = Pet.where(pet_type: "BUG")
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def search
    
  end

  private

  def search_pets
    render turbo_stream:
      turbo_stream.replace("pet-search",
        partial: "pets/searchresults".
        locals: {pets: pets}
      )
  end
end
