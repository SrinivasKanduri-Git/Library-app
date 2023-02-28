class CompaniesController < ApplicationController
  before_action :set_comp, only: %i[show edit update destroy]

  def show
  end

  def index
    @home = true
    @companies = Company.all
  end

  def edit
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(comp_params)
    if @company.save
      flash[:notice] = "company #{@company.company_name} added successfully."
      redirect_to @company
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @company.update(comp_params)
      flash[:notice] = "Company information updated successfully."
      redirect_to @company
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy
    flash[:notice] = "#{@company.company_name} deleted successfully."
    redirect_to companies_path
  end

  private

  def set_comp
    @company = Company.find(params[:id])
  end

  def comp_params
    params.require(:company).permit(:company_name, :established_on)
  end
end
