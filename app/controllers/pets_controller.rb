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
    @search_query = Pet.all

    if params.has_key?("pet_type")
      @search_query = Pet.where(
        pet_type: params[:pet_type]
      )
    end
    if params.has_key?("difficulty")
      @search_query = Pet.where(
        difficulty: params[:difficulty]
      )
    end
    if params.has_key?("size")
      @search_query = Pet.where(
        weight_class: params[:size]
      )
    end
    if params.has_key?("cost")
      @search_query = Pet.where(
        "pets.cost <= :cost", {cost: params[:cost].to_f}
      )
    end
    if params.has_key?("max_age")
      unless params[:max_age] == 20
        age_query = "pets.max_age < :max_age and pets.max_age > (:max_age - 5)" 
      else
        age_query = "pets.max_age >= 20"
      end
    end
    if params.has_key?("max_age") 
      @search_query = @search_query.where(age_query, {max_age: params[:max_age].to_i} )
    end

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
