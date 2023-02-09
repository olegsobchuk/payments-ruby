require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'associations' do
    it { should have_many(:transactions) }
    it { should have_many(:merchants).through(:transactions) }
  end

  describe 'validations' do
    describe 'email' do
      context 'without @' do
        let(:email) { 'somee.mail.com' }

        it { should_not allow_value(email).for(:email) }
      end

      context 'without host' do
        let(:email) { 'somee.mail.com@' }

        it { should_not allow_value(email).for(:email) }
      end

      context 'when valid' do
        let(:email) { 'some.e@meail.com' }

        it { should allow_value(email).for(:email) }
      end
    end

    describe 'phone' do
      let(:customer) { build(:customer, phone: phone) }

      before { customer.valid? }

      context 'with nil value' do
        let(:phone) { nil }

        it { expect(customer.errors[:phone]).to match_array([]) }
      end

      context 'with valid value without +' do
        let(:phone) { '123-3121212' }

        it { expect(customer.errors[:phone]).to match_array([]) }
      end

      context 'with valid value with +' do
        let(:phone) { '+123-3121212' }

        it { expect(customer.errors[:phone]).to match_array([]) }
      end

      context 'with chars' do
        let(:phone) { '+38000123456A' }

        it { expect(customer.errors[:phone]).not_to match_array([]) }
      end

      context 'with spaces' do
        let(:phone) { '123 42' }

        it { expect(customer.errors[:phone]).not_to match_array([]) }
      end
    end
  end
end
