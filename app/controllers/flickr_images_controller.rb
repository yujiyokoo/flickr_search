class FlickrImagesController < ApplicationController
  def index
  end

  def show
  end

  helper_method :flickr, :flickr_images, :search_form, :flickr_image, :keyword

  private

  def search_form
    @search_form = FlickrSearchForm.new(keyword: keyword)
  end

  def flickr
    @flickr ||= Flickr.new(YAML.load_file('config/flickr.yml'))
  end

  def flickr_images
    if keyword
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
