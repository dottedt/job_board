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
    # Slightly different because of the boolen values. Other wise .find(company_params)
    # would work.
    @company = Company.find(params[:id])

    if @company.update(company_params)
      redirect_to @company
    else
      render 'edit'
    end
  end

  def destroy
    @company.destroy

    render 'index'
  end

  private
  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
      params.require(:company).permit(:name, :url, :address, :show_address, :show_as_customer)
  end

end