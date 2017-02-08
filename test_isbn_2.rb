
require "minitest/autorun"
require_relative "isbn2.rb"


class TestISBN < Minitest::Test
	# Simple test to ensure basic shell of test file and required_relative is in place
	def test_1_returns_1
		assert_equal(1,1)
	end

## ISBN10 TESTING ##

	def test_2_ISBN10_invalid_length
		isbn_num = "0-321-14653-02"
		assert_equal(false,validate_input10(isbn_num))
	end

	def test_3_ISBN10_valid_length_special_character
		isbn_num = "321%14653-0"
		assert_equal(false,validate_input10(isbn_num))
	end

# Test was run prior to modifying for checksum logic.  It will now fail if this is not a valid ISBN.
	# def test_ISBN10_valid_length_and_characters
	# 	isbn_num = "0-321-14653-0"
	# 	assert_equal(true,validate_input10(isbn_num))
	# end

	def test_4_ISBN10_valid_length_x_in_incorrect_position
		isbn_num = "877195x869"
		assert_equal(false,validate_input10(isbn_num))
	end

	def test_5_ISBN10_valid_length_x_in_correct_position
		isbn_num = "877195869x"
		assert_equal(true,validate_input10(isbn_num))
	end

	def test_6_ISBN10_valid_number_first_example
		isbn_num = "0471958697"
		assert_equal(true,validate_input10(isbn_num))
	end

	def test_ISBN10_valid_number_second_example
		isbn_num = "0-321-14653-0"
		assert_equal(true,validate_input10(isbn_num))
	end

	def test_ISBN10_valid_number_third_example
		isbn_num = "877195869x"
		assert_equal(true,validate_input10(isbn_num))
	end

	def test_ISBN10_special_character_in_last_position
		isbn_num = "877195869&"
		assert_equal(false,validate_input10(isbn_num))
	end

## ISBN13 TESTING ## 

	def test_ISBN13_valid_number_first_example
		isbn_num = "9780470059029"
		assert_equal(true,validate_input13(isbn_num))
	end

	def test_ISBN13_valid_number_second_example
		isbn_num = "978-0-13-149505-0"
		assert_equal(true,validate_input13(isbn_num))
	end	

	def test_ISBN13_valid_number_third_example
		isbn_num = "978 0 471 48648 0"
		assert_equal(true,validate_input13(isbn_num))
	end

	def test_ISBN13_invalid_number_first_example
		isbn_num = "4780470059029"
		assert_equal(false,validate_input13(isbn_num))
	end

	def test_ISBN13_invalid_number_special_character
		isbn_num = "0-321@14653-034"
		assert_equal(false,validate_input13(isbn_num))
	end

	def test_ISBN13_invalid_number_too_many_digits
		isbn_num = "0-3214314653-034"
		assert_equal(false,validate_input13(isbn_num))
	end

	def test_ISBN13_invalid_number_too_few_digits
		isbn_num = "0-3214 4653-034"
		assert_equal(false,validate_input13(isbn_num))
	end

# Used valid number but modified checksum
	def test_ISBN13_invalid_checksum
		isbn_num = "978 0 471 48648 3"
		assert_equal(false,validate_input13(isbn_num))
	end

	def test_ISBN13_blank
		isbn_num = ""
		assert_equal(false,validate_input13(isbn_num))
	end

	def test_ISBN13_hyphen
		isbn_num = "-"
		assert_equal(false,validate_input13(isbn_num))
	end

	def test_ISBN_single_quote
		isbn_num = "0-321@146'3-034"
		assert_equal(false,validate_input13(isbn_num))
	end

	def test_ISBN_tab_charactere
		isbn_num = "0-321@146	3-034"
		assert_equal(false,validate_input13(isbn_num))
	end

end	