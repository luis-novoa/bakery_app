require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  let(:test_user) { build(:test_user) }
  let(:model_user) { create(:model_user) }

  def initial_user_setup
    test_user.name = 'test'
    test_user.password = 'HelloWorld'
  end
  

  describe 'name validations' do
    it 'check for name presence' do
      initial_user_setup
      test_user.name = ''
      expect(test_user.save).to eq(false)
    end

    it "check for name's minimum characters" do
      initial_user_setup
      test_user.name = 'a'
      expect(test_user.save).to eq(false)
    end

    it "check for name's maximum characters" do
      initial_user_setup
      test_user.name = 'a' * 21
      expect(test_user.save).to eq(false)
    end

    it "check for name's uniqueness" do
      initial_user_setup
      expect(test_user.save).to eq(false)
    end
  end

  describe 'password validations' do
    it 'check for password presence' do
      initial_user_setup
      test_user.password = ''
      expect(test_user.save).to eq(false)
    end

    it "check for password's minimum characters" do
      initial_user_setup
      test_user.password = 'a'
      expect(test_user.save).to eq(false)
    end

    it "check for password's maximum characters" do
      initial_user_setup
      test_user.password = 'a' * 21
      expect(test_user.save).to eq(false)
    end
  end

  describe "admin validations" do
    it "check for presence" do
      initial_user_setup
      expect(test_user.save).to eq(false) 
    end
  end
end
