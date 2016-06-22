require 'rails_helper'

RSpec.describe FlickrImagesController, type: :controller do
  let(:flickr) { double('flickr', photos: photos) }
  let(:photos) { double('photos', search: [], find_by_id: nil) }
  let(:flickr_class) { double('Flickr', new: flickr) }

  before do
    stub_const('Flickr', flickr_class)
  end

  describe '#index' do
    render_views

    context 'with no search param' do
      it 'does not call flickr search' do
        get :index
        expect(photos).not_to have_received(:search)
      end
    end

    context 'with search params' do
      it 'calls flickr search with params' do
        get :index, keyword: 'cats', page: 25
        expect(photos).to have_received(:search).with(text: 'cats', page: '25')
      end
    end
  end

  describe '#show' do
    render_views

    context 'with an image id' do
      it 'finds image by id' do
        get :show, id: '123'
        expect(photos).to have_received(:find_by_id).with('123')
      end
    end
  end
end
