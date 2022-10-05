class BirdsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response  

    # GET /birds
    def index 
        birds = Bird.all
        render json: birds
    end

    # GET /birds/:id
    def show
        bird = find_bird
        render json: bird
    # rescue ActiveRecord::RecordNotFound    
    #     render_not_found_response
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
        # Update bird using strong params from body of request
        # Render response
        bird = find_bird
        bird.update(bird_params)
        render json: bird
    # rescue ActiveRecord::RecordNotFound    
    #     render_not_found_response   
    end

    # PATCH '/birds/:id/like'
    def increment_likes
        # Find the bird by id from route params
        # Update bird using current bird.likes + 1 to update likes.
        # Render response
        bird = find_bird
        bird.update(likes: bird.likes + 1)
        render json: bird
    # rescue ActiveRecord::RecordNotFound    
    #     render_not_found_response
    end

    # DELETE /birds/:id
    def destroy
        # Find the bird by id from route params
        # If found destroy bird object from db
        # Render response
        bird = find_bird
        bird.destroy
        head :no_content
    # rescue ActiveRecord::RecordNotFound    
    #     render_not_found_response
    end



    private

    ## Strong params
    def bird_params
        params.permit(:name, :species, :likes) 
    end

    # Wherever need to find single Bird
    def find_bird
        # Returns nil if not found
        # bird = Bird.find_by(id: params[:id])
        # Return ActiveRecord exception
        bird = Bird.find(params[:id])
    end

    # If Bird not found.
    def render_not_found_response
        render json: { error: "Bird not found" }, status: :not_found
    end



####ORIGINAL

    # # GET /birds
    # def index 
    #     birds = Bird.all
    #     render json: birds
    # end

    # # GET /birds/:id
    # def show
    #     bird = Bird.find_by(id: params[:id])
    #     if bird
    #         render json: bird
    #     else
    #         render json: { error: "Bird not found" }, status: :not_found
    #     end
    # end

    # # POST /birds/
    # def create
    #     # byebug
    #     ## Strong params used
    #     bird = Bird.create(bird_params)
    #     # Or original explicitly specify attributes:
    #     # bird = Bird.create(name: params[:name], species: params[:species])
    #     render json: bird, status: :created
    # end

    # # PATCH /birds/:id
    # # update any attribute
    # def update
    #     # Find the bird by id from route params
    #     bird = Bird.find_by(id: params[:id])
    #     # Update bird using strong params from body of request
    #     # Render response
    #     if bird
    #         bird.update(bird_params)
    #         render json: bird
    #     else
    #         render json: { error: "Bird not found" }, status: :not_found
    #     end
    # end

    # # PATCH '/birds/:id/like'
    # def increment_likes
    #     # Find the bird by id from route params
    #     bird = Bird.find_by(id: params[:id])
    #     # Update bird using current bird.likes + 1 to update likes.
    #     # Render response
    #     if bird
    #         bird.update(likes: bird.likes + 1)
    #         render json: bird
    #     else
    #         render json: { error: "Bird not found" }, status: :not_found
    #     end

    # end

    # # DELETE /birds/:id
    # def destroy
    #     # Find the bird by id from route params
    #     bird = Bird.find_by(id: params[:id])
    #     # If found destroy bird object from db
    #     # Render response
    #     if bird
    #         bird.destroy
    #         head :no_content
    #     else
    #         render json: { error: "Bird not found" }, status: :not_found
    #     end

    # end



    # private

    # ## Strong params
    # def bird_params
    #    params.permit(:name, :species, :likes) 
    # end

end
