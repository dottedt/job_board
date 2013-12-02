require 'spec_helper'

describe JobSkillsController do
  describe 'Get #index' do
    it 'lists the job skill' do
      skill = create(:job_skill)
      get :index
      expect(assigns(:job_skills)).to eq([skill])
    end
    it 'renders the :index view' do
      get :index
      response.should render_template :index
    end
  end
  describe 'Get #show' do
    it 'assigns the requested job_skill to @job_skill' do
      skill = create(:job_skill)
      get :show, id: skill
      expect(assigns(:job_skill)).to eq skill
    end
    it 'renders the :show view' do
      get :show, id: create(:job_skill)
      response.should render_template :show
    end
  end
  describe 'Get #new' do
    it 'asssigns a new Job skill to @job_skill' do
      get :new
      expect(assigns(:job_skill)).to be_a_new(JobSkill)
    end
    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end
  describe 'Post #create' do
    context 'with valid attributes' do
      it 'creates a new Job skill' do
        expect{
          post :create, job_skill: attributes_for(:job_skill)
        }.to change(JobSkill, :count).by(1)
      end
      it 'redirects to the ....page' do
        post :create, job_skill: attributes_for(:job_skill)
        expect(response).to redirect_to job_skill_path(assigns[:job_skill])
      end
    end
  end
  context 'with invalid attributes' do
    it 'does not save the new job skill in the database' do
      expect{
        post :create, job_skill: attributes_for(:invalid_job_skill)
      }.to_not change(JobSkill, :count)
    end
    it 're-renders the :new template' do
      post :create, job_skill: attributes_for(:invalid_job_skill)
      expect(response).to render_template :new
    end
  end
  describe 'Patch #update' do
    before :each do
      @job_skill = create(:job_skill)
    end
    context 'valid attributes' do
      it 'located the requested @job_skill' do
        patch :update, id: @job_skill, job_skill: attributes_for(:job_skill)
        expect(assigns(:job_skill)).to eq(@job_skill)
      end
      it 'changes @job_skill attributes' do
        patch :update, id: @job_skill,
        job_skill: attributes_for(:job_skill,
                                    name: "This is the name of the skill")
        @job_skill.reload
        expect(@job_skill.name).to eq("This is the name of the skill")
      end
      it 'redirects to the updated job skill' do
        patch :update, id: @job_skill, job_skill: attributes_for(:job_skill)
        expect(response).to redirect_to @job_skill
      end
    end
    context 'with invalid attributest' do
      it 'does not change the job skill attributes' do
        patch :update, id: @job_skill,
          job_skill: attributes_for(:job_skill,
                                      name: nil)
        @job_skill.reload
        expect(@job_skill.name).to_not eq("A different name")
      end
      it 're-renders the edit template' do
        patch :update, id: @job_skill,
          job_skill: attributes_for(:invalid_job_skill)
        expect(response).to render_template :edit
      end
    end
  end
  describe 'DELETE destroy' do
    before :each do
      @job_skill = create(:job_skill)
    end
    it 'deletes the job skill' do
      expect{
        delete :destroy, id: @job_skill
      }.to change(JobSkill, :count).by(-1)
    end
    it 'redirects to job skills #index' do
      delete :destroy, id: @job_skill
      expect(response).to redirect_to job_skills_url
    end
  end
end