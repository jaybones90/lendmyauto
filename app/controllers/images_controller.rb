class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_imageable

  def new
    if @imageable.is_a?(Account || DriversLicense )
      @image = @imageable.build_image()
    else
      @image = @imageable.images.new()
    end
  end

  def create
    if @imageable.is_a?(Account || DriversLicense )
      @image = @imageable.build_image(image_params)
    else
      @image = @imageable.images.new(image_params)
    end

    if @image.save!
      redirect_to account_path(current_user.account)
    else
      render :new
    end

  end

  private

  def image_params
    params.require(:image).permit(:avatar)
  end

  def load_imageable
    resource, id = request.path.split('/')[1,2]
    @imageable = resource.singularize.classify.constantize.find(id)
  end

end
