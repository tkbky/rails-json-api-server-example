class Api::V1::PostsController < Api::V1::BaseController

  def index
    render json: Post.page(params.dig(:page, :number)).per(params.dig(:page, :size)), status: 200, each_serializer: PostSerializer
  end

end
