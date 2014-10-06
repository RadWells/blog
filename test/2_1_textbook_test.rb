require 'minitest/autorun'
require 'minitest/rg'
require 'csv'
require 'tempfile'
require_relative '../lib/page'
require_relative '../lib/textbook'

class TextbookCSVTest < Minitest::Test
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

  def file_name
    file = Tempfile.new('textbook')
    file.close
    file
  end

  def test_writes_a_file_in_csv_format
    # The file in fixtures/one_entry.csv shows the expected output
    # Note carefully! There is an empty line at the end of the file!
    # Note also that in this test we are not modifying the to_s method.
    # The next test does that.
    temp_file_name = file_name
    page = Page.new(page_data)
    textbook = Textbook.new(temp_file_name)
    textbook.insert(page)
    expected = File.read('test/fixtures/one_entry.csv')
    actual = File.read(temp_file_name)
    assert_equal(expected, actual, "The file stored by the textbook should be in CSV format.")
  end

  def test_to_s_reads_from_csv_properly
    skip
    page = Page.new(page_data)
    textbook = Textbook.new(file_name)
    textbook.insert(page)
    expected = "Header: #{page.header}\nTime: #{page.timestamp}\nArticle: #{page.article}"
    actual = textbook.to_s
    assert_equal(expected, actual, "We are storing the file in CSV format, but the to_s should be human readable.")
  end

  def test_handles_two_entries_well
    skip
    page1 = Page.new(page_data)
    page2 = Page.new(second_page_data)
    temp_file_name = file_name
    textbook = Textbook.new(temp_file_name)

    textbook.insert(page1)
    textbook.insert(page2)

    expected = File.read('test/fixtures/two_entries.csv')
    actual = File.read(temp_file_name)

    assert_equal(expected, actual, "Two entries should be in CSV format in the file that the textbook writes to")

    expected = "Header: #{page1.header}\nTime: #{page1.timestamp}\nArticle: #{page1.article}\nHeader: #{page2.header}\nTime: #{page2.timestamp}\nArticle: #{page2.article}"
    actual = textbook.to_s

    assert_equal(expected, actual, "The textbook's two entries should be human-readable.")

    actual = Textbook.new(temp_file_name).to_s
    assert_equal(expected, actual, "When passing in a file that has data, the textbook should properly read all of it as a string")
  end

  # def test_bonus_return_the_first_page
  #   skip
  #   page1 = Page.new(page_data)
  #   textbook = Textbook.new(file_name)
  #   textbook.insert(page1)
  #   first_page = textbook.first_page

  #   expected = Page
  #   actual = first_page.class
  #   assert_equal(expected, actual, "The object should be an instance of class Page")

  #   expected = page1.header
  #   actual = first_page.header
  #   assert_equal(expected, actual, "The header of the first page should match the header of the page object we created in the test")

  #   expected = page1.timestamp
  #   actual = first_page.timestamp
  #   assert_equal(expected, actual, "The timestamp of the first page should match the timestamp of the page object we created in the test")

  #   expected = page1.article
  #   actual = first_page.article
  #   assert_equal(expected, actual, "The article of the first page should match the article of the page object we created in the test")
  # end

  # def test_bonus_return_the_last_page
  #   page1 = Page.new(page_data)
  #   page2 = Page.new(second_page_data)
  #   textbook = Textbook.new(file_name)
  #   textbook.insert(page1)
  #   textbook.insert(page2)
  #   last_page = textbook.last_page

  #   expected = Page
  #   actual = last_page.class
  #   assert_equal(expected, actual, "The object should be an instance of class Page")

  #   expected = page2.header
  #   actual = last_page.header
  #   assert_equal(expected, actual, "The header of the first page should match the header of the page object we created in the test")

  #   expected = page2.timestamp
  #   actual = last_page.timestamp
  #   assert_equal(expected, actual, "The timestamp of the first page should match the timestamp of the page object we created in the test")

  #   expected = page2.article
  #   actual = last_page.article
  #   assert_equal(expected, actual, "The article of the first page should match the article of the page object we created in the test")
  # end

  # def test_bonus_lines_from_existing_file_are_also_pages
  #   skip
  #   # To make this one work properly, you'll need to look at
  #   # require 'time' as well as Time.parse
  #   page1 = Page.new(page_data)
  #   page2 = Page.new(second_page_data)
  #   temp_file_name = file_name
  #   textbook = Textbook.new(temp_file_name)
  #   textbook.insert(page1)
  #   textbook.insert(page2)

  #   new_textbook = Textbook.new(temp_file_name)

  #   last_page = new_textbook.last_page

  #   expected = Page
  #   actual = last_page.class
  #   assert_equal(expected, actual, "The object should be an instance of class Page")

  #   expected = page2.header
  #   actual = last_page.header
  #   assert_equal(expected, actual, "The header of the first page should match the header of the page object we created in the test")

  #   expected = page2.timestamp
  #   actual = last_page.timestamp
  #   assert_equal(expected, actual, "The timestamp of the first page should match the timestamp of the page object we created in the test")

  #   expected = page2.article
  #   actual = last_page.article
  #   assert_equal(expected, actual, "The article of the first page should match the article of the page object we created in the test")
  # end

end
