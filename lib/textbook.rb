class Textbook
	attr_reader :pagesource

	def initialize(file)
		@pagesource = file
	end

	def insert(page)
		File.open(@pagesource, "a+") do |f|
			f << page.to_s + "\n"
		end

	def to_s
		File.read(@pagesource).chomp
	end	
end





