class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(record_id: params[:record_id])
    redirect_to records_url, notice: "#{favorite.record.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to records_url, notice: "#{favorite.record.user.name}さんのブログをお気に入り解除しました"
  end
end
