require 'slim'

# Set slim-lang output style
Slim::Engine.set_default_options :pretty => true
# Set template languages
set :slim, :layout_engine => :slim

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true,
               :autolink => true,
               :smartypants => true,
               :no_intra_emphasis => true

page "/feed.xml", layout: false

activate :directory_indexes

# collect all the patterns in the app
# TODO this needs to not be slim specific, and needs to be recursive
@patterns = Dir["source/patterns/**/*.slim"]

@patterns.each do |pattern|
  proxy "/patterns/#{String(pattern.match(/_(.*)\.slim/)[1])}.html", "pattern.html", layout: 'pattern_layout', ignore: true, locals: {html: Tilt[:slim].new(pattern).render}
end

###
# Helpers
###
helpers do
  def code(name)
    <<-eos
      <div class='codeblock'>
        #{CodeRay.scan(partial("patterns/#{name}"), :html).div(line_numbers: :table, css: :class)}
      </div>
    eos
  end

  # needs to be an iframe to isolate the js/css
  def pattern(name)
    <<-eos
      <h1>#{name}</h1>
      <iframe src='patterns/#{name}' sandbox='allow-same-origin allow-scripts' scrolling='no' class='pattern'>
        #{partial("patterns/#{name}")}
      </iframe>
      #{code(name)}
    eos
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  activate :gzip
  #activate :gzip_assets

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :cache_buster

  # Use relative URLs
  # activate :relative_assets
end
