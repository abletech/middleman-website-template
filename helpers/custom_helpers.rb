module CustomHelpers
  def inline_css(*names)
    names.map { |name|
      name += ".css" unless name.include?(".css")
      css_path = sitemap.resources.select { |p| p.source_file.include?(name) }.first
      "<style>#{css_path.render}</style>"
    }.reduce(:+)
  end
end
