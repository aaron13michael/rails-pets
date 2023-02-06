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
      difficulty: params[:difficulty].to_i,
      weight_class: params[:size].to_i
    ).where(
      "pets.cost <= :cost", {cost: params[:cost].to_f}
    )
    unless params[:max_age] == 20
      age_query = "pets.max_age < :max_age and pets.max_age > (:max_age - 5)" 
    else
      age_query = "pets.max_age >= 20"
    end 
    @search_query = @search_query.where(age_query, {max_age: params[:max_age].to_i} )

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
