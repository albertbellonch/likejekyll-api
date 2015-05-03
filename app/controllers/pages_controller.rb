class PagesController < BaseController
  def show
    @page = Page.find_by_digest(params[:id])
    render json: @page
  end
end
