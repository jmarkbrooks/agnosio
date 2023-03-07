class Api::V1::ItemsController < ApplicationController
  before_action :get_item, only: [:show, :update, :destroy]
  
def index
    @items = Item.all
    render json: { error: "There are no items" }, status: :not_found and return unless @items.present?
    render json: @items
  end

  def show
    render json: { error: "Item not found" }, status: :not_found and return unless @item.present?
    if stale?(last_modified: @item.updated_at, public: true)
      render json: @item
    end
  end

  def create
    @item = Item.create(item_params(:name, :email))
    render json: @item, status: :created
  end

  def update
    render json: { error: "Item not found" }, status: :not_found and return unless @item.present?
    @item.update(item_params(:name, :email))
    render json: @item
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def item_params(*args)
    params.require(:item).permit(*args)
  end

  def get_item
    @item = Item.find(params[:id])
  end

end
