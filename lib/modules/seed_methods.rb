module SeedMethods
  # lorem_ipsum has to be 700 characters minimum
  def lorem_ipsum
    "Lorem ipsum dolor sit amet, mel an solet nominati, mel ea mundi adipisci reprehendunt. Decore euripidis an pro. Et has lorem dicta docendi, primis mollis facilis cum no. Veniam legimus signiferumque mea in. Magna mundi te est. Animal neglegentur usu ad, eam duis nonumes ceteros an. Quo no oporteat consulatu. Error consul principes eum no, an pro error erant. Nec in saepe iracundia comprehensam. Eu mel molestie sensibus prodesset, et sea impetus vidisse. Te eum minim eripuit posidonium, graece platonem posidonium cum ea. In causae lobortis contentiones his, harum iuvaret id est. Ignota invidun Lorem ipsum dolor sit amet, mel an solet nominati, mel ea mundi adipisci reprehendunt. Decore euripidis an pro. Et has lorem dicta docendi, primis mollis facilis cum no. Veniam legimus signiferumque mea in. Magna mundi te est. Animal neglegentur usu ad, eam duis nonumes ceteros an. Quo no oporteat consulatu. Error consul principes eum no, an pro error erant. Nec in saepe iracundia comprehensam. Eu mel molestie sensibus prodesset, et sea impetus vidisse. Te eum minim eripuit posidonium, graece platonem posidonium cum ea. In causae lobortis contentiones his, harum iuvaret id est. Ignota invidun."
  end

  # paragraph_number_range - min and max number of paragraphs (min..max)
  # put_headers - set to true if you want random headers between paragraphs
  # example - create_paragraphs(2..10, true)
  def create_paragraphs(paragraph_number_range, put_headers)
    paragraphs = ""
    rand(paragraph_number_range).times do
      title = ""
      title = create_header if [true, false].sample && put_headers
      paragraphs << (title+'<p>'+lorem_ipsum[0...rand(399..699)]+'</p>')
    end
    paragraphs
  end

  def create_header
      header_size = randomize_header_size([2,3,4,5])
    "<h#{header_size}>"+create_title(24..99).upcase+"</h#{header_size}>"
  end

  # header_sizes - array of header sizes you want to include in randomization
  # example - randomize_header_size([1,2,3,4,5]) - for all header sizes
  def randomize_header_size(header_sizes)
    header_sizes.sample.to_s
  end

  # length_range - range for title length
  # example - create_title(10..60)
  def create_title(length_range)
    lorem_ipsum[0...rand(length_range)].gsub(".", "")
  end

end