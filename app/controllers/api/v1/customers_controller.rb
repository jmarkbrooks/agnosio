class Api::V1::CustomersController < ApplicationController

  before_action :get_customer, only: [:show, :update, :destroy]
  # GET /customers 
  def index
    @customers = Customer.all
    render json: { error: "There are no customers" }, status: :not_found and return unless @customers.present?
    render json: @customers
  end

  # GET /customers/:id
  def show
    render json: { error: "Customer not found"}, status: :not_found and return unless @customer.present?
    if stale?(last_modified: @customer.updated_at, public: true)
      render json: @customer
    end
  end

  # POST /customers
  def create
    @customer = Customer.create(customer_params(:name, :email))
    render json: @customer, status: :created
  end

  # PUT /customers/:id 
  # PATCH /customers/:id 
  def update
    render json: { error: "Customer not found"}, status: :not_found and return unless @customer.present?
    @customer.update(customer_params(:name, :email))
    render json: @customer
  end

  # DELETE /customers/:id
  def destroy
    @customer.destroy
    head :no_content
  end

  private

  def customer_params(*args)
    params.require(:customer).permit(*args)
  end

  def get_customer
    @customer = Customer.find(params[:id])
  end

end
