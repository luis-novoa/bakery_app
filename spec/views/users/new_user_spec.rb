require 'rails_helper'
require 'spec_helper'

RSpec.describe 'new_user_registration', type: :feature do
  context "page structure" do
    before(:each) { visit new_user_registration_path }
    subject { page }

    it { is_expected.to have_field('user_name')}
    it { is_expected.to have_field('user_email')}
    it { is_expected.to have_field('user_password')}
  end

  context "unsuccessful registration" do
    let(:test_user) { build(:test_user) }
    before(:each) { visit new_user_registration_path }

    it "don't create user" do
      click_on 'Sign up'
      expect(User.count).to eq(0) 
    end
    
    it "display warnings" do
      click_on 'Sign up'
      expect(page).to have_selector('#error_explanation') 
    end

    it "returns to the same path" do
      click_on 'Sign up'
      visit current_path
      expect(current_path).to eq(new_user_registration_path)
    end
    
  end

  context "successful registration" do
    let(:test_user) { build(:test_user) }
    before(:each) { visit new_user_registration_path }

    def submit_form
      fill_in "user_name",	with: test_user.name 
      fill_in "user_email",	with: test_user.email 
      fill_in "user_password",	with: test_user.password
      fill_in "user_password_confirmation",	with: test_user.password
      click_on 'Sign up'
    end
    

    it "creates new user" do
      submit_form
      expect(User.count).to eq(1)  
    end

    it "redirects to new user's page" do
      submit_form
      current_user = User.find_by(name: test_user.name)
      expect(current_path).to eq(user_path(current_user))  
    end

    it "first new user is super admin" do
      submit_form
      current_user = User.find_by(name: test_user.name)
      expect(current_user.admin).to eq('super') 
    end
    
    it "next new users are regular users" do
      create(:model_user)
      submit_form
      current_user = User.find_by(name: test_user.name)
      expect(current_user.admin).to eq('user') 
    end
  end
end