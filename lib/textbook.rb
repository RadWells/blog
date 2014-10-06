require 'csv'

class Textbook
	attr_reader :pagesource
	def initialize(file)
		@pagesource = file
	end

	def insert(page)
		CSV.open(@pagesource, "wb") do |csv|
			csv << [page.header, page.article, page.timestamp]
		end
	end




	def to_s
		File.read(@pagesource).chomp
	end	
end





