require 'rails_helper'
require 'spec_helper'

RSpec.describe 'log in |', type: :feature do
  context "page structure" do
    before(:each) { visit new_user_session_path }
    subject { page }  

    it { is_expected.to have_link 'Go Back', href: root_path }
  end

end