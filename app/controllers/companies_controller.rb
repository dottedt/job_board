class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company, notice: 'Company was successfully created.'
    else
      render 'new'
    end
  end

  def update
    # Slightly different because of the boolen values and validation. Other wise .find(company_params)
    # would work.

    @company = Company.find(params[:id])

    if @company.update(company_params)
      redirect_to @company, notice: 'The Company was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_url
  end

  private
  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
      params.require(:company).permit(:name, :url, :address, :show_address, :show_as_customer)
  end

end