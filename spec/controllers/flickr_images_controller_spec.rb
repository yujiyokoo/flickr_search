require 'rails_helper'

RSpec.describe FlickrImagesController, type: :controller do
  let(:flickr) { double('flickr', photos: photos) }
  let(:photos) { double('photos', search: []) }
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
        get :index, flickr_search_form: { keyword: 'cats' }
        expect(photos).to have_received(:search).with(text: 'cats')
      end
    end
  end
end
