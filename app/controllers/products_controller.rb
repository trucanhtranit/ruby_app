class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Rails.cache.fetch("my_key99999", expires_in: 30.minutes) do
      Product.all.to_a
    end
  end

  # GET /products/1 or /products/1.json
  def show
    @product = $redis.hgetall("product:#{params[:id]}")
    $redis.lpush("product_tiltes", @product["title"])
  end

  # GET /products/new
  def new
    @product = Product.new
    $redis.sadd("product_set", "Product 1")
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    user = User.first

    respond_to do |format|
      if @product.save
        $redis.hset("product:#{@product.id}", product_params.to_h)
        UserMailer.welcome_email(user, @product).deliver_later
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        $redis.hset("product:#{@product.id}", product_params.to_h)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    $redis.del("product:#{@product.id}")
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :price, :description, :category_id)
    end
end
