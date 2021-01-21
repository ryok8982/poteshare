class BooksController < ApplicationController
  def index
    @books = current_user.rooms.all
  end

  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def edit
  end

  def show
  end
  
  private
    def book_params
      params.require(:book).permit(:check_in, :check_out, :people, :room_id)
    end
end
