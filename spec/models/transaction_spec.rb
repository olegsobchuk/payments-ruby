require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validations' do
    it { should belong_to(:merchant) }
    it { should belong_to(:customer) }
  end

  describe 'class methods' do
    describe '.total_amount' do
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
