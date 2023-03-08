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
      @search_query = @search_query.where(pet_type: params["pet_type"]) unless params["pet_type"].blank?
    end
    if params.has_key?("difficulty")
      @search_query = @search_query.where(difficulty: params["difficulty"]) unless params["difficulty"].blank?
    end
    if params.has_key?("size")
      @search_query = @search_query.where(weight_class: params["size"]) unless params["size"].blank?
    end
    if params.has_key?("intelligence")
      @search_query = @search_query.where(intelligence: params["intelligence"]) unless params["intelligence"].blank?
    end
    if params.has_key?("cost")
      @search_query = @search_query.where("pets.cost <= :cost", {cost: params["cost"]}) unless params["cost"].blank?
    end


    if params.has_key?("max_age")
      unless params["max_age"].blank?
        unless params[:max_age] == 20
          age_query = "pets.max_age < :max_age and pets.max_age > (:max_age - 5)" 
        else
          age_query = "pets.max_age >= 20"
          @search_query = @search_query.where(age_query, {max_age: params[:max_age]} )
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

end
