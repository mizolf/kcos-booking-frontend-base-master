class TinymceAssetsController < ApplicationController
  respond_to :json

  def create
    image = TinymcePicture.new params.permit(:file)
    if image.save
      render json: {
                 image: {
                     url: "#{image.file}"
                 }
             }, layout: false, content_type: "text/html"
    else
      render json: {status: 500, description: "Nest ne valja"}
    end
  end

end
