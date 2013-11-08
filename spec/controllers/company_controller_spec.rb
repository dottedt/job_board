require 'spec_helper'

describe CompaniesController do
  describe 'Get #index' do
    it 'lists the companies' do
      company = create(:company)
      get :index
      expect(assigns(:companies)).to eq([company])
    end
    it 'renders the :index view' do
      get :index
      response.should render_template :index
    end
  end
  describe 'Get #show' do
    it 'assignes the requested company to @company' do
      company = create(:company)
      get :show, id: company
      expect(assigns(:company)).to eq company
    end
    it 'renders the :show view' do
      get :show, id: create(:company)
      response.should render_template :show
    end
  end
  describe 'Get #new' do
    it 'assigns a new Company to @company' do
      get :new
      expect(assigns(:company)).to be_a_new(Company)
    end
    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end

  end
  describe 'Post #create' do
    context 'with valid attributes' do
      it 'create a new company' do
        expect{
          post :create, company: attributes_for(:company)
        }.to change(Company, :count).by(1)
      end

      it 'redirecto to the ......page' do
        post :create, company: attributes_for(:company)
        expect(response).to redirect_to company_path(assigns[:company])
      end

    end
    context 'with invalid attributes' do
      it 'does not save the new company in the database' do
        expect{
          post :create, company: attributes_for(:invalid_company)
        }.to_not change(Company, :count)
      end

      it 're-renders the :new template' do
        post :create,  company: attributes_for(:invalid_company)
        expect(response).to render_template :new
      end
    end
  end
  describe 'PATCH #update' do
    before :each do
      @company = create(:company)
    end
    context 'valid attributes' do
      it 'loacted the requested @company' do
        patch :update, id: @company, company: attributes_for(:company)
        expect(assigns(:company)).to eq(@company)
      end
      it 'changes @companies attributes' do
        patch :update, id: @company,
          company: attributes_for(:company,
                                  name: "This is a new company name")
          @company.reload
        expect(@company.name).to eq("This is a new company name")
      end
      it "redirects to the updated company" do
        patch :update, id: @company, company: attributes_for(:company)
        expect(response).to redirect_to @company
      end
    end
    context "with invalid attributes" do
      it "does not change the companies attributes" do
        patch :update, id: @company,
          company: attributes_for(:company,
                                  name: nil)
          @company.reload
        expect(@company.name).to_not eq("Another New Company Name")
      end
      it "re-renders the edit template" do
        patch :update, id: @company,
          company: attributes_for(:invalid_company)
        expect(response).to render_template :edit
      end
    end
  end

  describe'DELETE destroy'do
    before :each do
      @company = create(:company)
    end
    it "deletes the company" do
      expect{
        delete :destroy, id: @company
      }.to change(Company,:count).by(-1)
    end
    it "redirects to companys #index" do
      delete :destroy, id: @company
      expect(response).to redirect_to companies_url
    end
  end
end