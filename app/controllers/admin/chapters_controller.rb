class Admin::ChaptersController < AdminController
  def create
    Chapter.create(chapter_params)

    falsh[:notice] = "Chapter was successfully created"

    redirect_to admin_comic_path(chapter_params[:id])
  end

  def destroy
    chapter = Chapter.find_by(id: params[:id])

    if chapter.destroy
      flash[:notice] = "Chapter was successfully deleted"
      redirect_back_or_to admin_comic_path(params[:id])
    end
  end

  private
  def chapter_params
    params.require(:chapter).permit(:id, images: [])
  end
end
