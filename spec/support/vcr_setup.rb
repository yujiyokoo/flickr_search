VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.filter_sensitive_data("<API_KEY>") { Flickr.new(YAML.load_file('config/flickr.yml')).api_key }
  c.filter_sensitive_data("<API_SECRET>") { Flickr.new(YAML.load_file('config/flickr.yml')).api_secret }
end
