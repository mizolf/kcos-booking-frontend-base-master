module PostsHelper

	def post_timestamp(date)
		date.strftime("%d.%m.%Y.")
	end

	def visibility_mark(post)
		'not-visible' unless post.published?
	end

end