class PagesController < BaseController
  def show
    @page = Page.find_by(digest: params[:id])

    if @page.present?
      render json: @page
    else
      render nothing: true, status: 404
    end
  end
end
