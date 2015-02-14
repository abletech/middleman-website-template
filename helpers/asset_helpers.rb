require 'base64'

# Helpers for manipulating site assets
module AssetHelpers

  def inline_png(path, **options)
    asset = sprockets[path]
    image_tag(data_uri(asset, 'image/png'), options)
  end

  def inline_jpg(path, **options)
    asset = sprockets[path]
    image_tag(data_uri(asset, 'image/jpeg'), options)
  end

  def inline_javascript(path, **options)
    asset = sprockets["#{ ignored(path) }.js"]

    content_tag(:script, 'test', { type: 'text/javascript' }.merge(options))
  end

  def inline_stylesheet(path, **options)
    content_tag :style do
      rLineBreaks = /\n/
      rCSSComments = /\/\*[^*]*\*+(?:[^*\/][^*]*\*+)*\//
      rExtraSpaces = / +/
      rOpenBrackets = / \{ /
      rColons = /: /
      rSemiColons = /; /
      sprockets[ "#{path}.css" ].to_s.gsub(rCSSComments,'').gsub(rLineBreaks,'').gsub(rExtraSpaces,' ').gsub(rOpenBrackets, '{').gsub(rColons, ':').gsub(rSemiColons, ';')
    end
  end

  private

  def data_uri(asset, content_type)
    base64 = Base64.strict_encode64(asset.to_s)
    "data:#{ content_type };base64,#{ base64 }"
  end

  def ignored(path)
    path.sub(/([^\/]+)$/, '_\1')
  end
end
