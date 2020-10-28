class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end

  def index
    @gossips = Gossip.all
  end
  
  def show 
    @gossip = Gossip.find(params[:id])
    @user = User.all.sample
    @comment = Comment.new
    @comment.gossip_id = @gossip.id
    @comment.user_id = @user.id
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.find_by(id: 11))

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
end
