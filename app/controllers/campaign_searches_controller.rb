# frozen_string_literal: true

class CampaignSearchesController < ApplicationController
  def create
    session[:campaign_search] = CampaignSearch.new(campaign_search_params).to_gid_param
    redirect_to campaigns_path
  end

  def destroy
    session[:campaign_search] = CampaignSearch.new.to_gid_param
    redirect_to campaigns_path
  end

  private

    def campaign_search_params
      params.require(:campaign_search).permit(:name, :user)
    end
end