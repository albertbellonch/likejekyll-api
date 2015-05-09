class LikesController < BaseController
  def create
    if @page = Page.find_by(digest: params[:page_id])
      @identity = Identity.find_or_create_by(ip: request.remote_ip)

      if @identity.like!(@page)
        render nothing: true, status: 200
      else
        render nothing: true, status: 403
      end
    else
      render nothing: true, status: 404
    end
  end
end
