env_name = ENV['APP_ENV'] || 'development'
require "config/environments/#{env_name}"
require 'helpers/asset_helpers'

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

page "/sitemap.xml", :layout => false

set :site_name, 'Site'
set :env_name, env_name
set :font_dir, 'fonts'
set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'

set :url_root, ApplicationConfig::BASE_URL

# This section generates the pattern-library based on data/patterns.json
patterns_prefix = 'page_patterns_'
patterns_section_class = 'patterns'

data.patterns.each do |pattern|
	proxy "/patterns/#{pattern[:page_name]}",
	"patterns/template.html",
	:locals => {
		:examples => pattern[:examples],
		:page_name => pattern[:page_name],
		:page_title => pattern[:page_title],
		:page_classes => patterns_prefix + pattern[:page_name],
		:section_class => patterns_section_class,
		:page_description => pattern[:page_description]
	},
	:ignore => true
end

activate :directory_indexes
activate :gzip

activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', 'Explorer >= 9']
  config.cascade  = false
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash, :ignore => [/touch-icon/, /opengraph/]

  activate :minify_html do |html|
    html.remove_http_protocol    = false
    html.remove_input_attributes = false
  end
end

if ApplicationConfig.const_defined?(:S3)
  activate :s3_sync do |s3_sync|
    s3_sync.bucket                     = ApplicationConfig::S3::BUCKET # The name of the S3 bucket you are targeting. This is globally unique.
    s3_sync.region                     = 'ap-southeast-2'     # The AWS region for your bucket.
    s3_sync.aws_access_key_id          = ApplicationConfig::S3::ACCESS_ID
    s3_sync.aws_secret_access_key      = ApplicationConfig::S3::SECRET_KEY
    s3_sync.delete                     = false # We delete stray files by default.
    s3_sync.after_build                = false # We do not chain after the build step by default.
    s3_sync.prefer_gzip                = true
    s3_sync.path_style                 = true
    s3_sync.reduced_redundancy_storage = false
    s3_sync.acl                        = 'public-read'
    s3_sync.encryption                 = false
  end

  caching_policy 'text/css',               max_age: (60 * 60 * 24 * 365), public: true
  caching_policy 'application/javascript', max_age: (60 * 60 * 24 * 365), public: true
  caching_policy 'image/gif',              max_age: (60 * 60 * 24 * 365), public: true
  caching_policy 'image/png',              max_age: (60 * 60 * 24 * 365), public: true
  caching_policy 'image/jpeg',             max_age: (60 * 60 * 24 * 365), public: true
  caching_policy 'image/x-icon',           max_age: (60 * 60 * 24 * 365), public: true
  caching_policy 'image/svg+xml',          max_age: (60 * 60 * 24 * 365), public: true
  caching_policy 'application/font-woff',  max_age: (60 * 60 * 24 * 365), public: true
  # caching_policy 'text/html', max_age: (60 * 60 * 2), public: true

  activate :cloudfront do |cf|
    cf.access_key_id = ApplicationConfig::S3::ACCESS_ID
    cf.secret_access_key = ApplicationConfig::S3::SECRET_KEY
    cf.distribution_id = ApplicationConfig::S3::CLOUDFRONT_DIST_ID
    cf.filter = /\.html$/i
  end

  after_s3_sync do |files_by_status|
    invalidate(files_by_status[:updated] + files_by_status[:created] + files_by_status[:deleted])
  end
end
