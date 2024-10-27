class Admin::ComicsController < AdminController
  def index
    @pagy, @comics = pagy(Comic.all.order(created_at: :desc))
  end

  def new
    @comic = Comic.new
  end

  def create
    @comic = Comic.new(comic_params)
    if @comic.save
      redirect_to admin_comics_path
    else
      render :new
    end
  end

  def show
    @comic    = Comic.find(params[:id])
    @chapter  = Chapter.new
    @chapters = @comic.chapters
  end

  def edit
    @comic = Comic.find(params[:id])
  end

  def update
    @comic = Comic.find(params[:id])
    if @comic.update(comic_params)
      flash[:notice] = "Comic was successfully updated"
      redirect_to admin_comics_path
    else
      render :edit
    end
  end

  def destroy
    @comic = Comic.find_by(id: params[:id])
    if @comic.destroy
      redirect_to admin_comics_path, notice: "Comic was successfully deleted"
    else
      redirect_to admin_comics_path, notice: "false to delete comic"
    end
  end

  private
  def comic_params
    params.require(:comic).permit(:title, :description, :image_url, :author, :status, :available, :views_count, :category_id)
  end
end
