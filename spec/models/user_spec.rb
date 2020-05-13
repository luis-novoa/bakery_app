require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  subject { build(:test_user) } 

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(20) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to allow_value("email@test.com").for(:email) } 
  it { is_expected.to_not allow_value("emailtest.com").for(:email) }

  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(20) }

  it { is_expected.to validate_inclusion_of(:admin).in_array(%w[super admin user])}

  describe ".encrypted_password" do
    let(:model) { create(:model_user) }
    let(:test) { build(:test_user) }

    it "is unique" do
      test.password = model.password
      test.save
      expect(test.encrypted_password).to_not eq(model.encrypted_password)
    end
  end
end
