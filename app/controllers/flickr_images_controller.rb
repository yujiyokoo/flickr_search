class FlickrImagesController < ApplicationController
  def index
  end

  helper_method :flickr, :flickr_images, :search_form, :flickr_image

  private

  def search_form
    @search_form = FlickrSearchForm.new(keyword: keyword)
  end

  def flickr
    @flickr ||= Flickr.new(YAML.load_file('config/flickr.yml'))
  end

  def flickr_images
    if keyword
      @flickr_images ||= flickr.photos.search(text: keyword)
    else
      []
    end
  end

  def keyword
    params.fetch(:flickr_search_form, {}).fetch(:keyword, nil)
  end

  def flickr_image
    @image ||= flickr.photos.find_by_id(params[:id])
  end
end
