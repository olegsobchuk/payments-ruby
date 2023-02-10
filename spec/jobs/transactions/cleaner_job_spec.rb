require 'rails_helper'

RSpec.describe Transactions::CleanerJob do
  context 'with old transaction' do
    let(:merchant) { create(:merchant) }
    let(:customer) { create(:customer) }
    let!(:transaction) { create(:transaction_charge, customer: customer, merchant: merchant, created_at: 1.day.ago) }

    it { expect { described_class.perform_later }.to change(Transaction, :count).from(1).to(0)  }
  end
end
