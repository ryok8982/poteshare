class RoomsController < ApplicationController
  before_action :authenticate_user!, expect: [:index]
  
  def index
   @rooms = Room.where('title LIKE ? or address LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
   @name = current_user.username
  end

  def show
    @room = Room.find(params[:id])
    @name = current_user.username
    @book = Book.new
  end

  def new
    @room = Room.new
    @name = current_user.username
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    @room.save
    redirect_to room_path(@room)
    @name = current_user.username
  end

  def edit
    @room = Room.find(params[:id])
    @name = current_user.username
  end
  
  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to room_path(@room)
    @name = current_user.username
  end
  
  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to rooms_path
    @name = current_user.username
  end
  
  private
  def room_params
    params.require(:room).permit(:title, :body, :price, :address, :room_image)
  end
end