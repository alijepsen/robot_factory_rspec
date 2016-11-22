class RobotsController < ApplicationController
  before_action :set_inventor
  before_action :set_robot, except: [:new, :create]

 # def index
 #   @robots = @inventor.robots
 # end

  def show
  end

  def new
    @robot = @inventor.robots.new
  end

  def create
    @robot = @inventor.robots.new(robot_params) #this sets up scope correctly
      if @robot.save
        redirect_to inventor_robot_path(@inventor, @robot)
      else
        render :new
      end
  end

  def edit
  end

  def update
    if @robot.update(robot_params)
      redirect_to inventor_robot_path(@inventor, @robot) #show page
    else
      render :edit
    end
  end

  def destroy
    @robot.destroy
    redirect_to inventor_path(@inventor) #index page
  end

  private
    def robot_params
      params.require(:robot).permit(:name, :evil, :serial_number, :color, :industry)
    end

    def set_inventor
      @inventor = Inventor.find(params[:inventor_id]) #inventor_id comes from rake route
    end

    def set_robot
      @robot = @inventor.robots.find(params[:id])
    end
end
