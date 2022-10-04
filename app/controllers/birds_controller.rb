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

    # POST /birds/
    def create
        # byebug
        ## Strong params used
        bird = Bird.create(bird_params)
        # Or original explicitly specify attributes:
        # bird = Bird.create(name: params[:name], species: params[:species])
        render json: bird, status: :created
    end

    # PATCH /birds/:id
    # update any attribute
    def update
        # Find the bird by id from route params
        bird = Bird.find_by(id: params[:id])
        # Update bird using strong params from body of request
        # Render response
        if bird
            bird.update(bird_params)
            render json: bird
        else
            render json: { error: "Bird not found" }, status: :not_found
        end
    end

    # PATCH '/birds/:id/like'
    def increment_likes
        # Find the bird by id from route params
        bird = Bird.find_by(id: params[:id])
        # Update bird using current bird.likes + 1 to update likes.
        # Render response
        if bird
            bird.update(likes: bird.likes + 1)
            render json: bird
        else
            render json: { error: "Bird not found" }, status: :not_found
        end

    end

    # DELETE /birds/:id
    def destroy
        # Find the bird by id from route params
        bird = Bird.find_by(id: params[:id])
        # If found destroy bird object from db
        # Render response
        if bird
            bird.destroy
            head :no_content
        else
            render json: { error: "Bird not found" }, status: :not_found
        end

    end



    private

    ## Strong params
    def bird_params
       params.permit(:name, :species, :likes) 
    end

end
