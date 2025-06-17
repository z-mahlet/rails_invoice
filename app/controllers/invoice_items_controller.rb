class InvoiceItemsController < ApplicationController
  before_action :set_invoice_item, only: [:show, :update, :destroy]

  def index
    invoice_items = InvoiceItem.all
    render json: invoice_items
  end

  def show
    render json: @invoice_item
  end

  def create
    invoice_item = InvoiceItem.new(invoice_item_params)
    if invoice_item.save
      render json: invoice_item, status: :created
    else
      render json: invoice_item.errors, status: :unprocessable_entity
    end
  end

  def update
    if @invoice_item.update(invoice_item_params)
      render json: @invoice_item
    else
      render json: @invoice_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @invoice_item.destroy
    head :no_content
  end

  private

  def set_invoice_item
    @invoice_item = InvoiceItem.find_by(id: params[:id])
    unless @invoice_item
      render json: { error: 'Invoice item not found' }, status: :not_found
    end
  end

  def invoice_item_params
    params.require(:invoice_item).permit(:invoice_id, :item_id, :quantity, :price)
  end
end