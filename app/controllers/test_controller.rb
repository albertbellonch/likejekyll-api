class TestController < BaseController
  def check
    render json: { status: :ok }
  end
end
