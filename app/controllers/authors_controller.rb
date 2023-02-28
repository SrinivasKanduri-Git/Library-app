class AuthorsController < ApplicationController
  before_action :set_author, only: %i[show edit update destroy]

  def show
  end

  def index
    @authors = Author.all
  end

  def edit
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:notice] = "Author information added successfully."
      redirect_to @author
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @author.update(author_params)
      flash[:notice] = "Author information updated successfully."
      redirect_to @author
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @author.destroy
    flash[:notice] = "Author #{@author.author} deleted successfully."
    redirect_to authors_path
  end
  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:author)
  end
end
