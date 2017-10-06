module CustomHelpers
  def inline_css(*names)
    names.map { |name|
      name += ".css" unless name.include?(".css")
      css_path = sitemap.resources.select { |p| p.path == name }.first
      tempCSS = css_path.render
      rLineBreaks = /\n/
      rCSSComments = /\/\*[^*]*\*+(?:[^*\/][^*]*\*+)*\//
      rExtraSpaces = / +/
      rOpenBrackets = / \{ /
      rColons = /: /
      rSemiColons = /; /
      outputCSS = tempCSS.to_s.gsub(rCSSComments,'').gsub(rLineBreaks,'').gsub(rExtraSpaces,' ').gsub(rOpenBrackets, '{').gsub(rColons, ':').gsub(rSemiColons, ';')
      "<style>#{outputCSS}</style>"
    }.reduce(:+)
  end
end
