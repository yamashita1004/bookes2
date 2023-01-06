class BooksController < ApplicationController
  def new
    @book = Book.new
  end

def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  @book.save
  redirect_to books_path
end
  def index
    @books = Book.all
    @books = Book.new
   
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
