class BirdsController < ApplicationController
  def index
    birds = Bird.all
    #only: works for an array of hashes, unlike slice, etc. You can also use except:.
    render json: birds, only: [:id, :name, :species]
  end

  def show
  # Alternatively...
  #bird = Bird.find_by(id: params[:id])
  #render json: bird.slice(:id, :name, :species)
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end 

end