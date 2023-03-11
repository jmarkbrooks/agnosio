class Api::V1::OrdersController < ApplicationController
  before_action :get_order, only: [:show, :update, :destroy, :add_item]
  
  def index
    @orders = Order.all
    render json: { error: "There are no orders." }, status: :not_found and return unless @orders.present?
    render json: @orders
  end

  def show
    if stale?(last_modified: @order.updated_at, public: true)
      render json: @order, include: :item, methods: :total
    end
  end

  def create
    @order = Order.create(order_params(:submit, :ready, :complete, :customer_id))
    render json: @order, status: :created
  end

  def update
    @order.update(order_params(:submit, :ready, :complete))
    render json: @order, include: :item, methods: :total
  end

  def add_item
    logger.info params.inspect
    item_ids = params[:order][:items] || []
    items=item_ids.collect do |item_id|
      item = Item.find(item_id)
      render json: { error: "Item not found" }, status: :not_found and return unless item.present?
      item
    end
    @order.item << items
    combo_ids = params[:order][:combos] || []
    combos=combo_ids.collect do |combo_id|
      combo = Combo.find(combo_id)
      render json: { error: "Combo not found" }, status: :not_found and return unless combo.present?
      combo
    end
    @order.combo << combos
    render json: @order, include: [:item, :combo], methods: :total
  end

  def destroy
    @order.destroy
    head :no_content
  end

  private

  def order_params(*args)
    params.require(:order).permit(*args)
  end

  def get_order
    @order = Order.find(params[:id])
    render json: { error: "Order not found" }, status: :not_found and return unless @order.present?
  end

end
