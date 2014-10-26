class Page

  attr_accessor :header, :article, :timestamp


  def initialize(options={})
    @header = options["header"] || ""
    @article = options["article"] || ""
    @timestamp = options["timestamp"] 
end



  def to_s
    "Header: #{@header}\nTime: #{@timestamp}\nArticle: #{@article}"
  end
end
