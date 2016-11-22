class PartsController < ApplicationController
  before_action :set_robot
  before_action :set_part, except: [:index, :new, :create]

  def index
    @parts = @robot.parts
  end


  def new
    @part = @robot.parts.new
  end

  def create
    @part = @robot.parts.new(part_params)
    if @part.save
      redirect_to robot_parts_path(@robot)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @part.update(part_params)
      redirect_to robot_parts_path(@robot)
    else
      render :edit
    end
  end

  def destroy
    @part.destroy
    redirect_to robot_parts_path(@robot)
  end

  private
    def part_params
      params.require(:part).permit(:name, :number)
    end

    def set_robot
      @robot = Robot.find(params[:robot_id])
    end

    def set_part
      @part = @robot.parts.find(params[:id])
    end
end
