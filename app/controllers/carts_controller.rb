class CartsController < ApplicationController
  skip_before_action :authorize, only: %i[ index show create update destroy ]
  before_action :set_cart, only: %i[ show edit update destroy double_quantity ]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1 or /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: "Cart was successfully created." }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil

    respond_to do |format|
      format.html { redirect_to store_index_url, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #def double_quantity
    # Find the line_item using the cart's ID and the product_id from params
   # @line_item = @cart.line_items.find_by(product_id: params[:product_id])

    # If the line_item exists, double the quantity
    #if @line_item
     # @line_item.update(quantity: @line_item.quantity * 2)
    #end

    #redirect_to cart_path(@cart)
  #end

  #def double_quantity
    #@line_item = @cart.line_items.find(params[:line_item_id])      
     # if @line_item
      #  @line_item.update(quantity: @line_item.quantity * 2)
      #else
       # redirect_to cart_path(@cart), notice: 'Quantity doubled successfully.'
      #end
  #end

  def double_quantity
    @cart = Cart.find(params[:id])
    @cart.line_items.each do |line_item|
      line_item.update(quantity: line_item.quantity * 2)
    end
    redirect_to cart_path(@cart), notice: 'Total quantity of all items has been doubled.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.fetch(:cart, {})
    end

    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to store_index_url, notice: 'Invalid cart'
    end
end

