class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def new
  end

  def index
    @book =Book.new
    @books = Book.all
    @user = current_user
  end
  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    @user = current_user
    render :index
    end
  end

  def show
    @new_book= Book.new
    @books = Book.all
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(books_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end

  private

  def books_params
    params.require(:book).permit(:title, :body)
  end
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

end
