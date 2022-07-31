# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/edit' do
    let!(:user) { create(:user) }
    context 'when the user is logged in' do
      before { sign_in user }

      subject { get edit_user_registration_path }

      it 'should render user edit page' do
        subject
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the user is not logged in' do
      subject { get edit_user_registration_path }

      it 'should redirect to user sign-in page' do
        subject
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'PUT /users' do
    let!(:user) { create(:user) }
    let(:user_params) { { user: { name: 'new_user_name' } } }

    before { sign_in user }
    subject { put user_registration_path, params: user_params }

    it 'should update user data' do
      subject
      expect(user.reload.name).to eq 'new_user_name'
    end
  end
end
