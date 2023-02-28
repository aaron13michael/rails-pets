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

    for key in params
      puts params[key]
    end

    form_keys = ["pet_type", "difficulty", "size", "cost"]
    for key in form_keys
      @search_query = update_search_query key, @search_query
    end

    if params.has_key?("max_age")
      unless params["max_age"].blank?
        unless params[:max_age] == 20
          age_query = "pets.max_age < :max_age and pets.max_age > (:max_age - 5)" 
        else
          age_query = "pets.max_age >= 20"
          @search_query = @search_query.where(age_query, {max_age: params[:max_age].to_i} )
        end
      end
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

  def update_search_query(key, query)
    if params.has_key?(key)
      return query.where(
        pet_type: params[:pet_type]
      ) unless params[key].blank?
    end

    return query
  end
end
