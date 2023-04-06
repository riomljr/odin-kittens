class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.json {render :json => @kittens }
    end
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
      redirect_to root_path
    else
      flash.notice = "Oh no! Kitten was not saved, try again"
      redirect_to new_kitten_path
    end
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      redirect_to @kitten
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    redirect_to root_path

  end


  private

    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
