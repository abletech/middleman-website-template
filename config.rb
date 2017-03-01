set :env_name, ENV['APP_ENV'] || 'development'
require "environments/#{config[:env_name]}"

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }


###
# General configuration
###

set :site_name, 'My site'
set :site_short_name, 'Site'
set :site_description, 'My site’s description'

### Environment settings
set :url_root,              ApplicationConfig::BASE_URL
set :disallow_robots,       ApplicationConfig::DISALLOW_ROBOTS
set :enable_service_worker, ApplicationConfig::ENABLE_SERVICE_WORKER

activate :directory_indexes

# Build-specific configuration
configure :build do

  activate :gzip do |gzip|
    gzip.exts = %w(.js .css .html .htm .svg .txt .ico .eot .json .xml)
  end

  activate :asset_hash, :ignore => [/manifest/, /opengraph/, /touch-icon/, /service-worker/]

  activate :minify_html do |html|
    html.remove_http_protocol    = false
    html.remove_input_attributes = false
    html.remove_quotes           = true
    html.remove_intertag_spaces  = true
  end

end

# if ApplicationConfig.const_defined?(:S3)
#   activate :s3_sync do |s3_sync|
#     s3_sync.bucket                     = ApplicationConfig::S3::BUCKET # The name of the S3 bucket you are targeting. This is globally unique.
#     s3_sync.region                     = 'ap-southeast-2'     # The AWS region for your bucket.
#     s3_sync.aws_access_key_id          = ApplicationConfig::S3::ACCESS_ID
#     s3_sync.aws_secret_access_key      = ApplicationConfig::S3::SECRET_KEY
#     s3_sync.delete                     = false # We delete stray files by default.
#     s3_sync.after_build                = false # We do not chain after the build step by default.
#     s3_sync.prefer_gzip                = true
#     s3_sync.path_style                 = true
#     s3_sync.reduced_redundancy_storage = false
#     s3_sync.acl                        = 'public-read'
#     s3_sync.encryption                 = false
#   end

#   default_caching_policy                               max_age: (60 * 60 * 24 * 365), public: true
#   caching_policy 'text/html',                          max_age: (60 * 15), public: true
#   individual_caching_policy 'build/service-worker.js', max_age: 0, must_revalidate: true

#   activate :cloudfront do |cf|
#     cf.access_key_id = ApplicationConfig::S3::ACCESS_ID
#     cf.secret_access_key = ApplicationConfig::S3::SECRET_KEY
#     cf.distribution_id = ApplicationConfig::S3::CLOUDFRONT_DIST_ID
#     cf.filter = /\.html$/i
#   end

# end

activate :external_pipeline,
  name: :gulp,
  command: build? ? 'npm run production' : 'npm run gulp',
  source: ".tmp",
  latency: 1
