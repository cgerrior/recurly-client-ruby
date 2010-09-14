require 'spec_helper'

module Recurly
  describe Transaction do
    describe "#create" do
      let(:account) { Factory.create_account_with_billing_info("transaction") }

      before(:each) do
        @transaction = Transaction.create({
          :account => { :account_code => account.account_code },
          :amount_in_cents => 500,
          :description => "test transaction for $5"
        })
      end

      it "should save successfully" do
        @transaction.should_not be_nil
      end

      it "should set the correct amount" do
        @transaction.amount_in_cents.should == 500
      end

    end
  end
end