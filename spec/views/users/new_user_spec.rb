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

  context "succesful registration" do
    let(:test_user) { build(:test_user) }
    before(:each) { visit new_user_registration_path }

    it "creates new user" do
      fill_in "user_name",	with: test_user.name 
      fill_in "user_email",	with: test_user.email 
      fill_in "user_password",	with: test_user.password
      fill_in "user_password_confirmation",	with: test_user.password
      click_on 'Sign up'
      expect(User.count).to eq(1)  
    end
  end
end