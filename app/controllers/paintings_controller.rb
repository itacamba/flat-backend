class PaintingsController < ApplicationController

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
  

    
end
