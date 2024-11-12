class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "failed"
      render :new
    end
  end

  def index
    @books = Book.all
  end

  def show
  end

  def edit
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
