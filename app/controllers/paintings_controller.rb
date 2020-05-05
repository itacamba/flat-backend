class PaintingsController < ApplicationController


  def index
    paintings = Painting.all
    render json: paintings
  end

  def post

  end

  def update
    # byebug
    painting = Painting.find(params[:id])
    painting.update(url: params[:data])
  end
  
  def show
    # byebug
    render json: Painting.find(params[:id])
  end
  
  def destroy
    painting = Painting.find(params[:id])
    painting.destroy
  end

    
end
