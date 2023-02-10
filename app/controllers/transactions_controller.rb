class TransactionsController < ApplicationController
  # TODO: check implementation
  def create
    create_manager.perform
    status = create_manager.success? ? 200 : 400
    respond_to do |format|
      format.json { render head status }
      format.xml { render head status }
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:merchant_email, :customer_email, :amount)
  end

  def create_manager
    @create_manager ||= Transactions::CreateManager.new(transaction_params)
  end
end
