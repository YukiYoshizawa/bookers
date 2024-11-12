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
      @books = Book.all
      render :index
      # redirect_to books_path
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    # book.update(book_params)
    # redirect_to book_path(book.id)

    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      # flash.now[:alert] = "failed"
      # @book = Book.find(params[:id])
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
