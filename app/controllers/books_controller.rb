class BooksController < ApplicationController
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
    redirect_to book_path(book.id)
    else
    @books = Book.all
    @user = current_user
    render :index
    end
  end

  def show
    @book = Book.new
    @book = Book.all
    @user = current_user
    @books = Book.find(params[:id])
  end

  def edit
     @book = Book.all
     @book = Book.find(params[:id])
  end
  
  def update
    book=Book.find(params[:id])
    if book.update(book_params)
      flash[:notice]="You have creatad book successfully."
      redirect_to book_path(book.id)
    else
      @book = Book.all
      @book=Book.find(params[:id])
      @book.update(book_params)
      render :edit
    end
  end

  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to book_path(book.id)
  end

  private

  def books_params
    params.require(:book).permit(:title, :body)
  end
end
