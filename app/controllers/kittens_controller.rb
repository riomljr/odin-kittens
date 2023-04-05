class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(id)
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def create
    @kitten = Kitten.create(kitten_params)
    if @kitten.save
      flash.notice = "Congrats! You just saved a new Kitten!"
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
