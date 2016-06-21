class FlickrImagesController < ApplicationController
  def index
  end

  helper_method :flickr, :flickr_images

  private

  def flickr
    @flickr ||= Flickr.new(YAML.load_file('config/flickr.yml'))
  end

  def flickr_images
    if params[:keyword]
      @flickr_images ||= flickr.photos.search(text: params[:keyword]) 
    else
      []
    end
  end
end
