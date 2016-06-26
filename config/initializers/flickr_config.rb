Rails.application.config.flickr = Flickr.new(
  YAML.load(
    ERB.new(
      File.read("#{Rails.root}/config/flickr.yml.erb")
    ).result
  )
)
