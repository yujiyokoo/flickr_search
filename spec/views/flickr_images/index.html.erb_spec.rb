require 'rails_helper'

RSpec.describe 'flickr_images/index.html.erb' do
  before do
    allow(view).to receive(:flickr_images) { double('flickr_images', page: 1, pages: 10, to_a: []) }
    allow(view).to receive(:keyword) { '' }
    allow(view).to receive(:page) { nil }
  end

  it 'shows a text field in a search form' do
    render

    expect(rendered).to have_selector('form input[type=text]')
  end

  it 'shows a submit button in a search form' do
    render

    expect(rendered).to have_selector('form input[type=submit]')
  end

  context 'with images' do
    let(:image) { double('image', url: 'image.jpg', title: 'image title', id: '123') }

    before do
      allow(view).to receive(:flickr_images) { double('flickr_images', page: 1, pages: 10, to_a: [image]) }
    end

    it 'shows title' do
      render

      expect(rendered).to have_content('image title')
    end

    it 'shows a link to image details' do
      render

      expect(rendered).to have_selector('a[href="/flickr_images/123"]')
    end

    it 'shows image with the image url' do
      render

      expect(rendered).to have_selector('img[src$="image.jpg"]')
    end
  end
end
