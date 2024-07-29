class Admin::CategoriesController < AdminController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find_by(params[:id])
  end

  def update
    @category = Category.find_by(params[:id])

    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find_by(params[:id])
    if @category.destroy
      redirect_to admin_categories_path, notice: "Category was successfully deleted"
    else
      redirect_to admin_categories_path, notice: "false to delete category"
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
