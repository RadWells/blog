require 'minitest/autorun'
require 'minitest/rg'
require 'rack/test'
require 'tempfile'
require_relative '../app'

class WebAppTest < Minitest::Test
  include Rack::Test::Methods # Magic. Gives us "get".

  def app # Also magic. Consider the contents of the config.ru file.
    Sinatra::Application
  end

  def test_returns_the_to_s_version_of_the_textbook
    file = 'test/fixtures/one_entry.csv'
    app.set :blog_storage, file # Google 'sinatra configuration' or read the provided README.
    get '/entries'
    assert last_response.ok?
    header = "Header: The life of Pie"
    assert last_response.body.include?(header)
  end

  def test_returns_two_entries_too
    file = 'test/fixtures/two_entries.csv'
    app.set :blog_storage, file
    get '/entries'
    assert last_response.ok?
    header = "Header: The life of Pie"
    assert last_response.body.include?(header)
    header = "Header: Letter from Dorothy"
  end

  def test_can_add_a_new_entry
    file = Tempfile.new('blog')
    file.close
    app.set :blog_storage, file
    post '/entry', {
                    'header' => 'Writing a blog in Sinatra',
                    'timestamp' => Time.new(2014, 10, 1, 14, 30, 27),
                    'article' => 'This is really fun!'
                   }

    path_to_all_entries = '/entries'
    assert last_response.redirect?
    assert last_response.location.include?(path_to_all_entries)

    get '/entries'
    header = 'Writing a blog in Sinatra'
    assert last_response.body.include?(header)
  end

  def test_bonus_return_the_last_page
    app.set :blog_storage, 'test/fixtures/two_entries.csv'
    get '/last_entry'
    header = 'Dorothy'
    assert last_response.body.include?(header)
    first_page_header = 'Pie'
    assert !last_response.body.include?(first_page_header)
  end

end
