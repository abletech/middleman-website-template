module CustomHelpers
  def inline_css(*names)
    names.map { |name|
      name += ".css" unless name.include?(".css")
      css_path = sitemap.resources.select { |p| p.source_file.include?(name) }.first
      output_css = css_path.render
      rLineBreaks = /\n/
      rCSSComments = /\/\*[^*]*\*+(?:[^*\/][^*]*\*+)*\//
      rCommas = /, /
      rExtraSpaces = / +/
      rOpenBrackets = / \{ /
      rColons = /: /
      rSemiColons = /; /
      minified_css = output_css.to_s.gsub(rCSSComments,'').gsub(rLineBreaks,'').gsub(rCommas, ',').gsub(rExtraSpaces,' ').gsub(rOpenBrackets, '{').gsub(rColons, ':').gsub(rSemiColons, ';')
      "<style>#{minified_css}</style>"
    }.reduce(:+)
  end
end
