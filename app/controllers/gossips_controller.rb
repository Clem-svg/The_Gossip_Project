class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
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
end
