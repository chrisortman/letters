module StoriesHelper

	@@md = Redcarpet::Markdown.new(
		Redcarpet::Render::HTML.new(
			no_links: true,
			hard_wrap: true
	))
	
	def markdown(text)
		@@md.render(text).html_safe
	end
end
