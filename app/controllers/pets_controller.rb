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
    @pets = []
  end

  def update_search
    @search_query = Pet.where(
      pet_type: params[:pet_type],
      ease_of_care: params[:difficulty] #TODO: Rename column to difficulty
    )
    search_pets(@search_query)
  end

  private

  def search_pets(pets)
    render turbo_stream:
      turbo_stream.replace("search-results",
        partial: "pets/searchresults",
        locals: {pets: pets}
      )
  end
end
