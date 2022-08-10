class BookersController < ApplicationController

  def create
    @booker=Booker.new(booker_params)

    if @booker.save
      redirect_to booker_path(@booker.id), notice: 'Book was successfully created.'
    else
      @bookers=Booker.all
      render :index
    end
  end

  def index
    @bookers=Booker.all
    @booker=Booker.new
  end

  def show
    @booker=Booker.find(params[:id])
  end

  def edit
    @booker=Booker.find(params[:id])
  end

  def update
    @booker=Booker.find(params[:id])

    if @booker.update(booker_params)
      redirect_to booker_path(@booker.id), notice: 'Book was successfully created.'
    else
      render:edit
    end
  end

  def destroy
    booker=Booker.find(params[:id])
    booker.destroy
    redirect_to bookers_path
  end

  private

  def booker_params
    params.require(:booker).permit(:title,:body)
  end

end