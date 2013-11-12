class JobExperiencesController < ApplicationController
  before_action :set_job_experience, only: [:show, :edit, :update, :destroy]

  def index
   @job_experiences = JobExperience.all
  end

  def show
  end

  def new
    @job_experience = JobExperience.new
  end

  def edit
  end

  def create
    @job_experience = JobExperience.new(job_experience_params)
    if @job_experience.save
      redirect_to @job_experience, notice: 'Job Experience was sucessfully created'
    else
      render 'new'
    end
  end

  def update
    @job_experience = JobExperience.find(params[:id])

    if @job_experience.update(job_experience_params)
      redirect_to @job_experience, notice: 'The Job Experience was sucessfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @job_experience.destroy
    redirect_to job_experiences_url
  end

  private
  def set_job_experience
    @job_experience = JobExperience.find(params[:id])
  end

  def job_experience_params
    params.require(:job_experience).permit(:name)
  end

end