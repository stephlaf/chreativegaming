class SeoController < ApplicationController
  before_action :set_seo, only: [:edit_picture, :update_picture]

  def edit_picture
  end

  def update_picture
    @seo.update(seo_params)
    redirect_to :root
  end

  private

  def set_seo
    @seo = SeoTemplate.first
    authorize @seo
  end

  def seo_params
    params.require(:seo_template).permit(:home_page_picture)
  end
end
