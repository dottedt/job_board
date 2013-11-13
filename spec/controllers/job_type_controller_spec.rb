require 'spec_helper'

describe JobTypesController do
  describe 'Get #index' do
    it 'lists the job type' do
      type = create(:job_type)
      get :index
      expect(assigns(:job_types)).to eq([type])
    end
    it 'renders the :index view' do
      get :index
      response.should render_template :index
    end
  end
  describe 'Get #show' do
    it 'assigns the requested job_type to @job_type' do
      type = create(:job_type)
      get :show, id: type
      expect(assigns(:job_type)).to eq type
    end
    it 'renders the :show view' do
      get :show, id: create(:job_type)
      response.should render_template :show
    end
  end
  describe 'Get #new' do
    it 'asssigns a new Job type to @job_type' do
      get :new
      expect(assigns(:job_type)).to be_a_new(JobType)
    end
    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end
  describe 'Post #create' do
    context 'with valid attributes' do
      it 'creates a new Job type' do
        expect{
          post :create, job_type: attributes_for(:job_type)
        }.to change(JobType, :count).by(1)
      end
      it 'redirects to the ....page' do
        post :create, job_type: attributes_for(:job_type)
        expect(response).to redirect_to job_type_path(assigns[:job_type])
      end
    end
  end
  context 'with invalid attributes' do
    it 'does not save the new job type in the database' do
      expect{
        post :create, job_type: attributes_for(:invalid_job_type)
      }.to_not change(JobType, :count)
    end
    it 're-renders the :new template' do
      post :create, job_type: attributes_for(:invalid_job_type)
      expect(response).to render_template :new
    end
  end
  describe 'Patch #update' do
    before :each do
      @job_type = create(:job_type)
    end
    context 'valid attributes' do
      it 'located the requested @job_type' do
        patch :update, id: @job_type, job_type: attributes_for(:job_type)
        expect(assigns(:job_type)).to eq(@job_type)
      end
      it 'changes @job_type attributes' do
        patch :update, id: @job_type,
        job_type: attributes_for(:job_type,
                                    name: "This is the name of the job")
        @job_type.reload
        expect(@job_type.name).to eq("This is the name of the job")
      end
      it 'redirects to the updated job type' do
        patch :update, id: @job_type, job_type: attributes_for(:job_type)
        expect(response).to redirect_to @job_type
      end
    end
    context 'with invalid attributest' do
      it 'does not change the job type attributes' do
        patch :update, id: @job_type,
          job_type: attributes_for(:job_type,
                                      name: nil)
        @job_type.reload
        expect(@job_type.name).to_not eq("A different name")
      end
      it 're-renders the edit template' do
        patch :update, id: @job_type,
          job_type: attributes_for(:invalid_job_type)
        expect(response).to render_template :edit
      end
    end
  end
  describe 'DELETE destroy' do
    before :each do
      @job_type = create(:job_type)
    end
    it 'deletes the job type' do
      expect{
        delete :destroy, id: @job_type
      }.to change(JobType, :count).by(-1)
    end
    it 'redirects to job types #index' do
      delete :destroy, id: @job_type
      expect(response).to redirect_to job_types_url
    end
  end
end