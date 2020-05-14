require 'rails_helper'
require 'spec_helper'

RSpec.describe 'application-wide features |', type: :feature do
  context "page for not logged user" do
    before(:each) { visit root_path }
    subject { page } 

    it { is_expected.to have_link 'Sign Up', href: new_user_registration_path }
    it { is_expected.to have_link 'Log In', href: new_user_session_path }
    it { is_expected.to have_no_link 'Log Out', href: destroy_user_session_path }
    it { is_expected.to have_no_link 'Edit Your Info', href: edit_user_registration_path }
  end

  context "page for logged user" do
    let(:test_user) { create(:test_user) }
    before(:each) do 
      visit new_user_session_path
      fill_in "Email",	with: test_user.email 
      fill_in "Password",	with: test_user.password 
      click_on 'Log in'
      visit root_path
    end
    subject { page } 

    it { is_expected.to have_no_link 'Sign Up', href: new_user_registration_path }
    it { is_expected.to have_no_link 'Log In', href: new_user_session_path }
    it { is_expected.to have_link 'Log Out', href: destroy_user_session_path }
    it { is_expected.to have_link 'Edit Your Info', href: edit_user_registration_path }
  end
end