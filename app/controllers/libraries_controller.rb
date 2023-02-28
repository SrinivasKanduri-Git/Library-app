class LibrariesController < ApplicationController
  before_action :set_lib, only: %i[show edit update destroy]

  def show
  end

  def index
    @libraries = Library.all
  end

  def edit
  end

  def new
    @library = Library.new(lib_params)
    @company = Company.find(params[:format])
    unless params[:library] == nil
      @region = Array.new
      if params[:library][:region_ids] != nil
        params[:library][:region_ids].each do |reg_id|
          reg_id.to_i
          @region << Region.find(reg_id)
        end
      end
    end
  end

  def create
    @library = Library.new(lib_params)
    if @library.save
      flash[:notice] = "Library added successfully."
      redirect_to @library
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @library.update(lib_params)
      flash[:notice] = "Library updated successfully."
      redirect_to @library
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @library.destroy
    flash[:notice] = "#{@library.lib_name} library deleted successfully."
    redirect_to libraries_path
  end

  private

  def set_lib
    @library = Library.find(params[:id])
  end

  def lib_params
    params.fetch(:library, {}).permit(:lib_name, location_ids: [], region_ids: [])
  end
end
