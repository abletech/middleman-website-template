# Configuration
# =================================================================================

# Dependencies
# See ./helpers

# Path settings
set :css_dir, 'css'
set :data_dir, 'data'
set :fonts_dir, 'fonts'
set :helpers_dir, 'helpers'
set :images_dir, 'img'
set :js_dir, 'js'
set :layouts_dir, '_layouts'

activate :directory_indexes

task_build = 'npm run webpack:build'
task_serve = 'npm run webpack:server'

activate :external_pipeline,
  name: :webpack,
  command: build? ? task_build : task_serve,
  source: '.tmp/dist',
  latency: 1

# Layout settings
# =================================================================================

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Server config (Development by default)
# =================================================================================

configure :server {

  activate :livereload

}

# Build config (Production by default)
# =================================================================================

configure :build {

  ignore '**/.keep'

  activate :asset_hash, ignore: %w{
    opengraph.png
    *touch-icon*.*
    service-worker.js
    *.xml
    *.txt
    *.json
    favicon.ico
  }

  activate :minify_css

  activate :minify_html do |html|
    html.remove_http_protocol    = false
    html.remove_input_attributes = false
    html.remove_quotes           = true
    html.remove_intertag_spaces  = true
  end

  activate :gzip do |gzip|
    gzip.exts = %w(.js .css .html .htm .svg .txt .xml .ico)
  end

}
