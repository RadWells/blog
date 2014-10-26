require_relative 'test_helper'
require_relative '../lib/page'
require_relative '../lib/textbook'

class TextbookTest < Minitest::Test

  def page_data
    {
     "header" => "The life of Pie",
     "article" => "Wherein our heroes make and eat pies",
     "timestamp" => Time.new(2014, 3, 14, 15, 29, 43)
    }
  end

  def second_page_data
    {
     "header" => "Letter from Dorothy",
     "article" => "Aunty Em: hate you. Hate Kansas. Taking the dog.",
     "timestamp" => Time.new(1939, 8, 15, 12, 30, 0)
    }
  end

  def file_as_storage
    file = Tempfile.new('textbook')
    file.close
    file
  end

  def test_can_add_a_page
    expected_data = page_data
    page = Page.new(expected_data)

    textbook = Textbook.new(file_as_storage)
    textbook.insert(page)
    expected = "Header: #{expected_data["header"]}\nTime: #{expected_data["timestamp"]}\nArticle: #{expected_data["article"]}"
    actual = textbook.to_s
    assert_equal(expected, actual)
  end

  def test_shows_multiple_pages
    skip
    expected_data = page_data
    second_expected_data = second_page_data
    page = Page.new(expected_data)
    page2 = Page.new(second_expected_data)

    textbook = Textbook.new(file_as_storage)
    textbook.insert(page)
    textbook.insert(page2)

    expected = "Header: #{expected_data["header"]}\nTime: #{expected_data["timestamp"]}\nArticle: #{expected_data["article"]}\nHeader: #{second_expected_data["header"]}\nTime: #{second_expected_data["timestamp"]}\nArticle: #{second_expected_data["article"]}"
    actual = textbook.to_s

    assert_equal(expected, actual)
  end

  def test_reads_from_an_existing_file
    skip
    expected_data = page_data
    second_expected_data = second_page_data
    page = Page.new(expected_data)
    page2 = Page.new(second_expected_data)

    textbook = Textbook.new(file_as_storage)
    textbook.insert(page)
    textbook.insert(page2)

    textbook2 = Textbook.new(page_source)

    expected = "Header: #{expected_data["header"]}\nTime: #{expected_data["timestamp"]}\nArticle: #{expected_data["article"]}\nHeader: #{second_expected_data["header"]}\nTime: #{second_expected_data["timestamp"]}\nArticle: #{second_expected_data["article"]}"
    actual = textbook2.to_s

    assert_equal(expected, actual)
  end

end
