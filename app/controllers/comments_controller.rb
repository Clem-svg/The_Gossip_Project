class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create, :new]

  def create
    @comment = Comment.new(post_params)
    @comment.gossip_id = params[:gossip_id]
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "New comment Save in DB"
      redirect_to gossip_path(@comment.gossip_id)
    else
      @comment.errors.messages
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    if is_author(@comment.user)
      @gossip = Gossip.find(@comment.gossip.id)
    else
      flash[:alert] = "Nop !"
      render :edit
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if is_author(@comment.user)
      if @comment.update(comment_params)
        flash[:notice] = "All good, your comment has been edited bro !"
        redirect_to gossip_path(@comment.gossip)
      else
        render :edit
      end
    else
      flash[:alert] = "Nop !"
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if is_author(@comment.user)
      @comment.destroy
      flash[:notice] = "All good, your gossip has been deleted bro !"
      redirect_to gossip_path(@comment.gossip)
    else
      flash[:alert] = "Nop !"
      render :edit
    end
  end

  private
  def post_params
    params.require(:comment).permit(:content)
  end

  def authenticate_user
    unless current_user
      flash[:alert] = "You need to login in order to see all gossips !"
      redirect_to new_session_path
    end
  end
end
