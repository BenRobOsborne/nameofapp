class CommentUpdateJob < ApplicationJob
  queue_as :default

  def perform(comment, current_user)
    ProductChannel.broadcast_to comment.product_id, comment: CommentsController.render(partial: 'comments/comment', locals: {comment: comment, current_user: current_user}), average_rating: comment.product.average_rating_comment

  end
end

private

  def render_comment(comment, current_user)
    CommentsController.render(partial: 'comments/comment', locals: { comment: comment, current_user: current_user })
  end
