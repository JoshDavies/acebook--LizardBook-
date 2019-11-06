class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
   @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def edit
  @comment = Comment.find(params[:id])
end

  def create
    current_user = session[:user_id]
    post_id = params[:post_id]
    @comment = Comment.new(comment_params)
    redirect_path = params.require(:comment).permit(:redirect_path)[:redirect_path]
    @comment.save
    redirect_to redirect_path
  end

  def update
    @comment = Comment.find(params[:id])


    redirect_path = params.require(:comment).permit(:redirect_path)[:redirect_path]
    p "------------------------------"
    p redirect_path
    p "------------------------------"

    if
       @comment.update(comment_params)
       redirect_to redirect_path
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to comments_path
  end

private
  def comment_params
    params.require(:comment).permit(:text,:post_id, :user_id, :id)
  end
end
