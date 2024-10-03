class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    render :new, status: :unprocessable_entity unless @room.save
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
