class CommentsController < ApplicationController
  def create
    comment = Comment.create(text: comment_params[:text], item_id: comment_params[:item_id], user_id: current_user.id)
    redirect_to "/items/#{comment.item.id}"   #コメントと結びつくアイテムの詳細画面に遷移す
  end
    
  @comment = Comment.create(text: comment_params[:text], item_id: comment_params[:item_id], user_id: current_user.id)

  if @comment.save
  else
    flash[:notice] = "コメントできません"
  end
   


  private
  def comment_params
    params.permit(:text, :item_id)
  end

end