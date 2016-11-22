class InventorsController < ApplicationController
  before_action :set_inventor, only: [:edit, :update, :show, :destroy]

  def index
    @inventors = Inventor.all
  end

  def edit
  end

  def update
    if @inventor.update(inventor_params)
      redirect_to inventor_path(@inventor)
    else
      render :edit
    end
  end

  def new
    @inventor = Inventor.new
  end

  def create
    params[:inventor][:hire_date] = Date.today
    @inventor = Inventor.new(inventor_params)
    if @inventor.save
      redirect_to inventor_path(@inventor)
    else
      render :new
    end
  end

  def show
    @robots = @inventor.robots #instead of having this in the view put it here
  end

  def destroy
    @inventor.destroy
    redirect_to inventors_path
  end

  private

  def inventor_params
    params.require(:inventor).permit(:name, :age, :hire_date, :speciality)
  end

  def set_inventor
    @inventor = Inventor.find(params[:id])
  end

end
