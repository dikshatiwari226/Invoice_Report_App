class InvoicesController < ApplicationController

	def new
		@invoice = Invoice.new
	end

	def create

		Stripe.api_key = 'sk_test_mjoMHspX73ijf6dnIT4n7j7J00gcIp1dtK'
		
		 customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

		Stripe::InvoiceItem.create({
		  customer: customer.id,
		  amount: 2500,
		  currency: 'usd',
		  description: 'One-time setup fee',
		})

		# customer = Invoice.create({
  #     title: params[:invoice][:title],
  #   })

		invoice = Stripe::Invoice.create({
		  customer: customer.id,
		  auto_advance: true, # auto-finalize this draft after ~1 hour
		})

		
    redirect_to root_path 

	end

	def index
		@invoices = Invoice.all
	end

	def show
		@invoice = Invoice.find(params[:id])
	end

	def edit
		
	end

	def update
		
	end

	def delete
		
	end

	def category_params
      params.require(:invoice).permit(:title, :description, :deadline, :currency, :total, :start_date, :end_date, :status)
  end

end
