class FavoritesController < ApplicationController
  before_action :find_gossip
  before_action :find_favorite, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "Tu peux pas liker plus d'une fois en vrai"
    else
      @gossip.favorites.create(user_id: current_user.id)
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @favorite.destroy
    end
    redirect_back(fallback_location: root_path)
  end

  def find_favorite
    @favorite = @gossip.favorites.find(params[:id])
  end

  private
  def find_gossip
    @gossip = Gossip.find(params[:gossip_id])
  end

  def already_liked?
    Favorite.where(user_id: current_user.id, gossip_id:
    params[:gossip_id]).exists?
  end
end
