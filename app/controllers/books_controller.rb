class BooksController < ApplicationController
  before_action :find_book, except: %i[index new create]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      @books = Book.search_by_attributes(params[:query])
                   .where(available: true)
                   .where.not(user: current_user)
    else
      @books = Book.where(available: true)
                   .where.not(user: current_user)
    end
  end

  def show
    @trade = Trade.new
    @review = Review.new(book: @book)

    @markers = [{
      lat: @book.user.latitude,
      lng: @book.user.longitude
    }]
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save!
      redirect_to book_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    find_book
  end

  def update
    @book.update(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, status: :see_other
  end

  def change_availability_to_true
    @book.available = true
    @book.save!
    redirect_to profile_path
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :year, :genre, :photo)
  end
end
