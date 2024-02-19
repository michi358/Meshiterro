class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  # 一覧画面
  def index
    @post_image = PostImage.all
  end

  # 詳細画面
  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  # 削除機能
  def destroy
    post_image = PostImage.find(params[:id])
	  post_image.destroy
	  redirect_to post_images_index
  end

  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)

  end
end
