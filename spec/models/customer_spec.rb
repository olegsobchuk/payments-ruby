require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'associations' do
    it { should have_many(:transactions) }
    it { should have_many(:merchants).through(:transactions) }
  end

  describe 'validations' do
    context 'email without @' do
      let(:email) { 'somee.mail.com' }

      it { should_not allow_value(email).for(:email) }
    end

    context 'email without host' do
      let(:email) { 'somee.mail.com@' }

      it { should_not allow_value(email).for(:email) }
    end

    context 'email valid' do
      let(:email) { 'some.e@meail.com' }

      it { should allow_value(email).for(:email) }
    end
  end
end
