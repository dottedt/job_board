class JobSkillsController < ApplicationController
  before_action :set_job_skill, only: [:show, :edit, :update, :destroy]

  def index
    @job_skills = JobSkill.all
    @sorted_skills = @job_skills.order("name, version")
  end

  def show
  end

  def new
    @job_skill = JobSkill.new
  end

  def edit
  end

  def create
    @job_skill = JobSkill.new(job_skill_params)
    if @job_skill.save
      redirect_to @job_skill, notice: 'Job skill was sucessfully saved'
    else
      render 'new'
    end
  end

  def update
    @job_skill = JobSkill.find(params[:id])

    if @job_skill.update(job_skill_params)
      redirect_to @job_skill, notice: 'The Job skill was successfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @job_skill.destroy
    redirect_to job_skills_url
  end

  private

    def set_job_skill
      @job_skill = JobSkill.find(params[:id])
    end

    def job_skill_params
      params.require(:job_skill).permit(:name, :version)
    end

end
