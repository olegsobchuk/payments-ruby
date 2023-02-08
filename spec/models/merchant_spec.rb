require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'associations' do
    it { should have_many(:transactions) }
    it { should have_many(:customers).through(:transactions) }
  end

  describe 'instance methods' do
    describe '#total_transactions_sum' do
      let(:merchant) { create(:merchant) }
      let(:customer) { create(:customer) }
      let!(:transaction1) do
        create(
          :transaction_authorize,
          merchant: merchant, customer: customer, amount: 0.1 # edge case with sum 0.1 and 0.2
        )
      end
      let!(:transaction2) { create(:transaction_authorize, merchant: merchant, customer: customer, amount: 0.2) }

      it { expect(merchant.total_transactions_sum).to eq(0.3) }
    end
  end
end
