VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.filter_sensitive_data("<API_KEY>") do
    Flickr.new(
      YAML.load(
        ERB.new(
          File.read("#{Rails.root}/config/flickr.yml.erb")
        ).result
      )
    ).api_key
  end
  c.filter_sensitive_data("<API_SECRET>") do
    Flickr.new(
      YAML.load(
        ERB.new(
          File.read("#{Rails.root}/config/flickr.yml.erb")
        ).result
      )
    ).api_secret
  end
end
