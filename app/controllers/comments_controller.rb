class CommentsController < ApplicationController
  before_action :find_comment, only: [:edit, :update, :destroy]

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to product_path(@product)
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
  end


private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

end
