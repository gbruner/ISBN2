require "minitest/autorun"
require_relative  "isbn.rb"

class Test_ISBN < Minitest::Test



#Examples of valid ISBN-13:
#{}"9780470059029"
def ISBN_good13_1 
	ISBN == "9780470059029"
	assert_equal(true,check_isbn(ISBN))
end	

#{}"978-0-13-149505-0"
def ISBN_good13_2 
	ISBN == "978-0-13-149505-0"
	assert_equal(true,check_isbn(ISBN))
end	

#{}"978 0 471 48648 0"
def ISBN_good13_3 
	ISBN == "978 0 471 48648 0"
	assert_equal(true,check_isbn(ISBN))
end	

#Examples of valid ISBN-10:
#{}"0471958697"
def ISBN_good10_1 
	ISBN == "0471958697"
	assert_equal(true,check_isbn(ISBN))
end	

#{}"0-321-14653-0"
def ISBN_good10_2 
	ISBN == "0-321-14653-0"
	assert_equal(true,check_isbn(ISBN))
end	

#{}"877195869x"
def ISBN_good10_3
	ISBN == "877195869x"
	assert_equal(true,check_isbn(ISBN))
end	

#Examples of invalid ISBNs:
#{}"4780470059029"
def ISBN_bad13_1
	ISBN == "4780470059029"
	assert_equal(false,check_isbn(ISBN))
end	
#{}"0-321@14653-0"
def ISBN_bad13_2
	ISBN == "0-321@14653-0"
	assert_equal(false,check_isbn(ISBN))
end	
#{}"877195x869"
def ISBN_bad10_1
	ISBN == "877195x869"
	assert_equal(false,check_isbn(ISBN))
end	
#{}""
def ISBN_bad_4
	ISBN == ""
	assert_equal(false,check_isbn(ISBN))
end
#{}" "
def ISBN_bad_5
	ISBN == " "
	assert_equal(false,check_isbn(ISBN))
end
#{}"-"
def ISBN_bad_6
	ISBN == "-"
	assert_equal(false,check_isbn(ISBN))
end

end  #class
