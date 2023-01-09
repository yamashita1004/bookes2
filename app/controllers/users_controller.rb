class UsersController < ApplicationController
  def index
    @book =Book.new
    @book = Book.all
    @users = User.all
    @user = current_user
  end
  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    @book.save
    flash[:notice] = "You have updated user successfully."
    redirect_to books_path(@book.id)
  end

  def show
    @book = Book.all
    @users = User.all
    @user = User.find(params[:id])
    @books = @user.books

  end
 def edit
  is_matching_login_user
   @user = User.find(params[:id])
    user_id = params[:id].to_i
  login_user_id = current_user.id
  if(user_id != login_user_id)
    
    redirect_to users_path
  end

    @user = User.find(params[:id])
 end
 
def update
  is_matching_login_user
  @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
  redirect_to user_path(@user.id)
  else
    flash[:notice] = " errors prohibited this obj from being saved:"
    render :edit
  end
end

private

  def user_params
    params.require(:user).permit(:name)
  end
  
  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to books_path(@book.id)
    end
  end
end