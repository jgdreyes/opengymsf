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


#set :css_dir, '//localhost:4200/assets/stylesheets'

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# General configuration

Slim::Engine.set_options pretty: true, sort_attrs: false



activate :external_pipeline,
  name: :broccoli,
  command: "cd asset-project/ && broccoli #{build? ? "build dist" : :serve}",
  source: "asset-project/dist",
  latency: 2


# Reload the browser automatically whenever files change
configure :development do
  activate :livereload#, ignore: ["asset-project"]

  puts "HERE in development"
  activate :asset_host, host: "//localhost:4200/assets"
end

# Build-specific configuration
configure :build do
  Slim::Engine.set_options pretty: false, sort_attrs: true

  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript


  activate :asset_host, host: "assets"


  activate :relative_assets
  set :relative_links, true
end
