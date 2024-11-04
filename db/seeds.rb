# look up "lib/modules/seed_methods.rb"
include SeedMethods
# puts create_title(10..70)
# puts create_paragraphs((1..4), true)
puts 'Begin Seeding...                🧐'

print 'Admin...........................'
Admin.create!(first_name: "Bamboo",
  last_name: "Lab",
  password: "vise nije adminadmin",
  superadmin: true,
  email: "contact@bamboolab.eu")
print '✅'
puts ''

unless Space.count > 0
  print 'Spaces..........................'
	space = Space.create!(
		name: "Prostor A",
		surface_area: "75",
		description: create_paragraphs((2..4), true),
		book_price_cents: 7000,
		rent_price_cents: 230000,
		bookable: true,
		rentable: false,
		bookable_from: 720,
		bookable_to: 1260
	)

	rand(2..4).times{ space.space_images.create!(remote_image_url: "https://picsum.photos/1024/768") }

	space = Space.create!(
		name: "Prostor B",
		surface_area: "200",
		description: create_paragraphs((2..4), true),
		book_price_cents: 17000,
		rent_price_cents: 400000,
		bookable: true,
		rentable: false,
		bookable_from: 0,
		bookable_to: 1440
	)

	rand(2..4).times{ space.space_images.create!(remote_image_url: "https://picsum.photos/1024/768") }

	space = Space.create!(
		name: "Prostor C",
		surface_area: "30",
		description: create_paragraphs((2..4), true),
		book_price_cents: 4000,
		rent_price_cents: 130000,
		bookable: true,
		rentable: false,
		bookable_from: 480,
		bookable_to: 1140
	)

	rand(2..4).times{ space.space_images.create!(remote_image_url: "https://picsum.photos/1024/768") }

	space = Space.create!(
		name: "Prostor D",
		surface_area: "120",
		description: create_paragraphs((2..4), true),
		book_price_cents: 10000,
		rent_price_cents: 320000,
		bookable: true,
		rentable: false,
		bookable_from: 420,
		bookable_to: 1110
	)

	rand(2..4).times{ space.space_images.create!(remote_image_url: "https://picsum.photos/1024/768") }
  print '✅'
  puts ''
end

unless Post.count > 0
  print 'Posts...........................'
	13.times do |i|
		post = Post.create!(
			remote_image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Kabood_%28Blue%29_mosque%2C_Tabriz%2C_Iran.jpg/1080px-Kabood_%28Blue%29_mosque%2C_Tabriz%2C_Iran.jpg",
			image_alt: create_title(10..60),
			publish_at: Date.today + rand(-30..0).days,
			title: create_title(10..60),
			summary: create_title(60..150),
			text: create_paragraphs((3..25), true),
			seo_keywords: 'neki, keywordsi, seedani',
      preview: false
		)
	end
  print '✅'
  puts ''
end

unless Faq.count > 0
  print 'FAQ.............................'
  11.times do
		Faq.create!(
			question: 	create_title(60..150),
			answer: 	create_title(100..250)
		)
	end
  print '✅'
  puts ''
end

print 'Landing Page....................'
  LandingPage.create!(
    about_project: create_paragraphs((3..25), true)
  )
print '✅'
puts ''

puts 'Do not forget to put some images!'

print 'Pages...........................'
['Pocetna', 'Novosti', 'Cesta pitanja', 'Dokumenti'].each do |page|
	PageMetaTag.create!(
		page: page,
		title: page,
		og_title: page,
		description: create_title(60..150),
		keywords: create_title(60..100).gsub('.', '').gsub(',', '').gsub(' ', ', ')
	)
end
print '✅'
puts ''

unless LegalPage.count > 0
  print 'Legal Pages.....................'
	LegalPage.create!(
		name: 'Pravila korištenja',
		title: 'Pravila korištenja',
		content: create_paragraphs((3..25), true),
		seo_description: create_title(60..130),
		seo_keywords: create_title(60..100).gsub('.', '').gsub(',', '').gsub(' ', ', '),
		seo_title: 'Pravila korištenja'
	)
  print '✅'
  puts ''
end

puts 'Seeding Completed Succesfully!  🥳'
