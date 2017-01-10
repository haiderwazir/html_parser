require 'rails_helper'

RSpec.describe HtmlContentsController, type: :controller do

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:html_content)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:invalid_html_content)
  }

  describe "GET #index" do
    it "assigns all html_contents as @html_contents" do
      html_content = HtmlContent.create! valid_attributes
      get :index, params: {}
      expect(assigns(:html_contents)).to include(html_content)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new HtmlContent" do
        expect {
          post :create, params: {html_content: valid_attributes}
        }.to change(HtmlContent, :count).by(1)
      end

      it "assigns a newly created html_content as @html_content" do
        post :create, params: {html_content: valid_attributes}
        expect(assigns(:html_content)).to be_a(HtmlContent)
        expect(assigns(:html_content)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved html_content as @html_content" do
        post :create, params: {html_content: invalid_attributes}
        expect(assigns(:html_content)).to be_a_new(HtmlContent)
      end

      it "shows error" do
        post :create, params: {html_content: invalid_attributes}
        expect(response.status).to eq 422
      end
    end
  end
end
