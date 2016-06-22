class FlickrImagesController < ApplicationController
  def index
  end

  def show
  end

  helper_method :flickr, :flickr_images, :flickr_image, :keyword

  private

  def flickr
    @flickr ||= Flickr.new(
      YAML.load(
        ERB.new(
          File.read("#{Rails.root}/config/flickr.yml.erb")
        ).result
      )
    )
  end

  def flickr_images
    if keyword.present?
      @flickr_images ||= flickr.photos.search(text: keyword, page: page)
    else
      []
    end
  end

  def page
    params.fetch(:page, 1)
  end

  def keyword
    params.fetch(:keyword, nil)
  end

  def flickr_image
    @image ||= flickr.photos.find_by_id(params[:id])
  end
end
