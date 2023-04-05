class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def create
    @kitten = Kitten.create(kitten_params)
    if @kitten.save
      flash.notice = "Congrats! You just saved a new Kitten!"
      redirect_to new_kitten_path
    else
      flash.notice = "Oh no! Kitten was not saved, try again"
      redirect_to new_kitten_path
    end
  end

  def update
  end

  private

    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
