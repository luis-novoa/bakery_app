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
end