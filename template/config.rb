# Configuration
# =================================================================================

# Dependencies
# See ./helpers

# Path settings
set :css_dir, 'css'
set :fonts_dir, 'fonts'
set :images_dir, 'img'
set :js_dir, 'js'

activate :directory_indexes
activate :relative_assets
set :relative_links, true

task_build = 'npm run webpack:build'
task_serve = 'npm run webpack:server'

activate :external_pipeline,
  name: :webpack,
  command: build? ? task_build : task_serve,
  source: '.tmp/dist',
  latency: 1

activate :robots,
  :rules => [
    {:user_agent => '*', :allow => %w(/)}
  ],
  :sitemap => '/sitemap.xml'

# Layout settings
# =================================================================================

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false


configure :development do
  set :env, 'development'
end

configure :staging do
  set :env, 'staging'
end

configure :production do
  set :env, 'production'
end

# Server config (Development by default)
# =================================================================================

configure :server {

  activate :livereload,
    no_swf: true,
    livereload_css_target: 'css/style.main.css'

}

# Build config (Production by default)
# =================================================================================

configure :build {

  ignore '**/.keep'

  if data.site.make_icons == true
    activate :favicon_maker do |f|
      # Requires ImageMagick. `brew install ImageMagick`
      f.template_dir  = 'source/img'
      f.icons = {
        'touch-icon-512x512.png' => [
          { icon: 'mstile-310x310.png', size: '310x310' },
          { icon: 'apple-touch-icon-precomposed.png', size: '180x180'}
        ],
        'touch-icon-256x256.png' => [
          { icon: 'apple-touch-icon-152x152-precomposed.png', size: '152x152'},
          { icon: 'mstile-150x150.png', size: '150x150'}
        ],
        'touch-icon-96x96.png' => [
          { icon: 'mstile-70x70.png', size: '70x70' },
          { icon: 'apple-touch-icon.png', size: '57x57' },
          { icon: 'favicon.ico', size: '32x32,16x16' }
        ]
      }
    end
  end

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

# configure :deploy {

# }
