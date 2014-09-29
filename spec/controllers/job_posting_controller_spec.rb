require 'spec_helper'


describe JobPostingsController do
  login_user
  describe 'Get #index' do
    it 'lists the job posting' do
      posting = create(:job_posting)
      get :index
      expect(assigns(:job_postings)).to eq([posting])
    end
    it 'renders the :index view' do
      get :index
      response.should render_template :index
    end
  end
  describe 'Get #show' do
    it 'assigns the requested job_posting to @job_posting' do
      posting = create(:job_posting)
      get :show, id: posting
      expect(assigns(:job_posting)).to eq posting
    end
    it 'renders the :show view' do
      get :show, id: create(:job_posting)
      response.should render_template :show
    end
  end
  describe 'Get #new' do


    it 'asssigns a new Job Posting to @job_posting' do
      get :new
      expect(assigns(:job_posting)).to be_a_new(JobPosting)
    end
    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end
  describe 'Post #create' do
    context 'with valid attributes' do
      it 'creates a new Job Posting' do
        expect{
          post :create, job_posting: attributes_for(:job_posting)
        }.to change(JobPosting, :count).by(1)
      end
      it 'redirects to the ....page' do
        post :create, job_posting: attributes_for(:job_posting)
        expect(response).to redirect_to job_posting_path(assigns[:job_posting])
      end
    end
  end
  context 'with invalid attributes' do
    it 'does not save the new job posting in the database' do
      expect{
        post :create, job_posting: attributes_for(:invalid_job_posting)
      }.to_not change(JobPosting, :count)
    end
    it 're-renders the :new template' do
      post :create, job_posting: attributes_for(:invalid_job_posting)
      expect(response).to render_template :new
    end
  end
  describe 'Patch #update' do

    before :each do
      @job_posting = create(:job_posting)
    end
    context 'valid attributes' do
      it 'located the requested @job_posting' do
        patch :update, id: @job_posting, job_posting: attributes_for(:job_posting)
        expect(assigns(:job_posting)).to eq(@job_posting)
      end
      it 'changes @job_posting attributes' do
        patch :update, id: @job_posting,
        job_posting: attributes_for(:job_posting,
                                    title: "This is the title of the job")
        @job_posting.reload
        expect(@job_posting.title).to eq("This is the title of the job")
      end
      it 'redirects to the updated job posting' do
        patch :update, id: @job_posting, job_posting: attributes_for(:job_posting)
        expect(response).to redirect_to @job_posting
      end
    end
    context 'with invalid attributest' do
      it 'does not change the job posting attributes' do
        patch :update, id: @job_posting,
          job_posting: attributes_for(:job_posting,
                                      title: nil)
        @job_posting.reload
        expect(@job_posting.title).to_not eq("A different title")
      end
      it 're-renders the edit template' do
        patch :update, id: @job_posting,
          job_posting: attributes_for(:invalid_job_posting)
        expect(response).to render_template :edit
      end
    end
  end
  describe 'DELETE destroy' do
    before :each do
      @job_posting = create(:job_posting)
    end
    it 'deletes the job posting' do
      expect{
        delete :destroy, id: @job_posting
      }.to change(JobPosting, :count).by(-1)
    end
    it 'redirects to job postings #index' do
      delete :destroy, id: @job_posting
      expect(response).to redirect_to job_postings_url
    end
  end
end