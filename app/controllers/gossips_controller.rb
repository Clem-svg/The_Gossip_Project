class GossipsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def new
    @gossip = Gossip.new
  end

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @user = User.last
    @comment = Comment.new
    @comment.gossip_id = @gossip.id
    @comment.user_id = @user.id
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: current_user)

    if @gossip.save
      flash[:notice] = "New gossip Save in DB"
      redirect_to root_path
    else
      puts "$" * 30
      puts "error message"
      puts "$" * 30
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to gossip_path
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  private
  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Il faut s'enregistrer bb"
      redirect_to new_session_path
    end
  end

end
