class BooksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @books = Book.all
  end

  def new
    @room = Room.find(params[:room_id])
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to room_book_path(@book.room_id, @book)
  end

  def edit
  end

  def show
    @book = Book.find(params[:id])
    @room = Room.find(params[:room_id])
    @price = (@book.check_out.to_date - @book.check_in.to_date).to_i * @room.price * @book.people
  end
  
  private
    def book_params
      params.require(:book).permit(:check_in, :check_out, :people, :room_id, :user_id)
    end
end
