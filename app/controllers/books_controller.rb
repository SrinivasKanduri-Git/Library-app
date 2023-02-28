class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def show
  end

  def index
    @books = Book.all
    @library = Library.find(params[:library_id])
  end

  def edit
  end

  def new
    @book = Book.new
    if params.include?(:library_id)
      @library = Library.find(params[:library_id])
    else
      @library = Library.all
    end
    @author = Author.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book added successfully."
      redirect_to @book
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      flash[:notice] = "Book details updated successfully."
      redirect_to @book
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @library = @book.library
    @book.destroy
    flash[:notice] = "#{@book.title} book deleted successfully."
    redirect_to books_path(library_id: @library.id)
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :availability,
                                 :summary, :no_of_pages, :publication_date,
                                 :library_id, :author_id)
  end
end
