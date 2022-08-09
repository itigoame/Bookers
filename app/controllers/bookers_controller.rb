class BookersController < ApplicationController

  def create
    booker=Booker.new(booker_params)
    booker.save
    redirect_to booker_path(booker.id)
  end

  def index
    @bookers=Booker.all
    @booker=Booker.new
  end

  def show
    @booker=Booker.find(params[:id])
  end

  def edit
  end

  private

  def booker_params
    params.require(:booker).permit(:title,:body)
  end

end