class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: [:show, :edit, :update, :destroy]

  def index
    @job_postings = JobPosting.all
  end

  def show
  end

  def new
    @job_posting = JobPosting.new
  end

  def edit
  end

  def create
    @job_posting = JobPosting.new(job_posting_params)
    if @job_posting.save
      redirect_to @job_posting, notice: 'Job posting was successfully created.'
    else
      render 'new'
    end
  end

  def update
    @job_posting = JobPosting.find(params[:id])

    if @job_posting.update(job_posting_params)
      redirect_to @job_posting, notice: 'The Job posting was sucessfully updated'
    else
      render  'edit'
    end
  end

  def destroy
    @job_posting.destroy
    redirect_to job_postings_url
  end

  private
    def set_job_posting
      @job_posting = JobPosting.find(params[:id])
    end

    def job_posting_params
      params.require(:job_posting).permit(:experience, :category, :title, :relocation, :remote, :freelance, :would_have_done, :compensation, :nice_to_have)
    end

end