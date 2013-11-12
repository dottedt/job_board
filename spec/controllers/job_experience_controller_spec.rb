require 'spec_helper'

describe JobExperiencesController do
  describe 'Get #index' do
    it 'lists the job Experience' do
      Experience = create(:job_experience)
      get :index
      expect(assigns(:job_experiences)).to eq([Experience])
    end
    it 'renders the :index view' do
      get :index
      response.should render_template :index
    end
  end
  describe 'Get #show' do
    it 'assigns the requested job_experience to @job_experience' do
      Experience = create(:job_experience)
      get :show, id: Experience
      expect(assigns(:job_experience)).to eq Experience
    end
    it 'renders the :show view' do
      get :show, id: create(:job_experience)
      response.should render_template :show
    end
  end
  describe 'Get #new' do
    it 'asssigns a new Job Experience to @job_experience' do
      get :new
      expect(assigns(:job_experience)).to be_a_new(JobExperience)
    end
    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end
  describe 'Post #create' do
    context 'with valid attributes' do
      it 'creates a new Job Experience' do
        expect{
          post :create, job_experience: attributes_for(:job_experience)
        }.to change(JobExperience, :count).by(1)
      end
      it 'redirects to the ....page' do
        post :create, job_experience: attributes_for(:job_experience)
        expect(response).to redirect_to job_experience_path(assigns[:job_experience])
      end
    end
  end
  context 'with invalid attributes' do
    it 'does not save the new job Experience in the database' do
      expect{
        post :create, job_experience: attributes_for(:invalid_job_experience)
      }.to_not change(JobExperience, :count)
    end
    it 're-renders the :new template' do
      post :create, job_experience: attributes_for(:invalid_job_experience)
      expect(response).to render_template :new
    end
  end
  describe 'Patch #update' do
    before :each do
      @job_experience = create(:job_experience)
    end
    context 'valid attributes' do
      it 'located the requested @job_experience' do
        patch :update, id: @job_experience, job_experience: attributes_for(:job_experience)
        expect(assigns(:job_experience)).to eq(@job_experience)
      end
      it 'changes @job_experience attributes' do
        patch :update, id: @job_experience,
        job_experience: attributes_for(:job_experience,
                                    name: "This is the name of the job")
        @job_experience.reload
        expect(@job_experience.name).to eq("This is the name of the job")
      end
      it 'redirects to the updated job Experience' do
        patch :update, id: @job_experience, job_experience: attributes_for(:job_experience)
        expect(response).to redirect_to @job_experience
      end
    end
    context 'with invalid attributest' do
      it 'does not change the job Experience attributes' do
        patch :update, id: @job_experience,
          job_experience: attributes_for(:job_experience,
                                      name: nil)
        @job_experience.reload
        expect(@job_experience.name).to_not eq("A different name")
      end
      it 're-renders the edit template' do
        patch :update, id: @job_experience,
          job_experience: attributes_for(:invalid_job_experience)
        expect(response).to render_template :edit
      end
    end
  end
  describe 'DELETE destroy' do
    before :each do
      @job_experience = create(:job_experience)
    end
    it 'deletes the job Experience' do
      expect{
        delete :destroy, id: @job_experience
      }.to change(JobExperience, :count).by(-1)
    end
    it 'redirects to job Experiences #index' do
      delete :destroy, id: @job_experience
      expect(response).to redirect_to job_experiences_url
    end
  end
end