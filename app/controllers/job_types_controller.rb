class JobTypesController < ApplicationController
  before_action :set_job_posting, only: [:show, :edit, :update, :destroy]

  def index
    @job_types = JobType.all
  end

  def show
  end

  def new
    @job_type = JobType.new
  end

  def edit
  end

  def create
    @job_type = JobType.new(job_type_params)
    if @job_type.save
      redirect_to @job_type, notice: 'Job type was sucessfully saved'
    else
      render 'new'
    end
  end

  def update
    @job_type = JobType.find(params[:id])

    if @job_type.update(job_type_params)
      redirect_to @job_type, notice: 'The Job type was sucessfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @job_type.destroy
    redirect_to job_types_url
  end

  private

    def set_job_posting
      @job_type = JobType.find(params[:id])
    end

    def job_type_params
      params.require(:job_type).permit(:name, :skills)
    end
end