set :css_dir, 'css'
set :data_dir, 'data'
set :fonts_dir, 'fonts'
set :helpers_dir, 'helpers'
set :images_dir, 'img'
set :js_dir, 'js'
set :layouts_dir, '_layouts'

activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

activate :directory_indexes

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :server {
  #enable sprockets debugging
  activate :livereload
}

configure :build {
  ignore '**/.keep'
  ignore '**/scss/**/*'
  activate :gzip
  activate :minify_html
  activate :asset_hash, ignore: %w{
    opengraph.png
    *touch-icon*.*
    service-worker.js
    *.xml
    *.txt
    *.json
    favicon.ico
  }
}

task_build = 'npm run webpack:build'
task_serve = 'npm run webpack:server'

activate :external_pipeline,
  name: :webpack,
  command: build? ? task_build : task_serve,
  source: '.tmp/dist',
  latency: 1
