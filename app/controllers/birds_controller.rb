class BirdsController < ApplicationController
    # GET /birds
    def index 
        birds = Bird.all
        render json: birds
    end

    # GET /birds/:id
    def show
        bird = Bird.find_by(id: params[:id])
        if bird
            render json: bird
        else
            render json: { error: "Bird not found" }, status: :not_found
        end
    end

    # CREATE
    def create
        # byebug
        ## Strong params used
        bird = Bird.create(bird_params)
        # Or original explicitly specify attributes:
        # bird = Bird.create(name: params[:name], species: params[:species])
        render json: bird, status: :created
    end

    private

    ## Strong params
    def bird_params
       params.permit(:name, :species) 
    end

end
