class CheesesController < ApplicationController

    # Get all
    def index
        # byebug
        cheeses = Cheese.all
        # cheeses = Cheese.order(price: :desc)
        # cheeses = Cheese.limit(2).order(price: :asc)
        
        # render json: cheeses
        
        ##Serializer 
        # Custom rendering
        render json: cheeses, only: [:id, :name, :price]
        # render json: cheeses, except: [:created_at, :updated_at], methods: [:summary]
    end

    # Get single
    def show
        # byebug
        # Return single object by :id
        cheese = Cheese.find(params[:id])
        # render json: cheese

        ## Error handling - Rendering
        if cheese
            render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
        else
            render json: { error: "Cheese not found"}, status: :not_found
        end

    end

    # Get single
    # Param other than id.
    def name
        # byebug
        # Return single object by name
        cheese = Cheese.find_by(name: params[:name])
        render json: cheese
    end
end
