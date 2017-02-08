#AIM:
#Create a program that will verify if a string is a valid ISBN number (see requirements below).
#Use a TDD approach. This is a big exercise - break it down into chunks!

#REQUIREMENTS FOR ISBN
#ISBN-10 is made up of 9 digits plus a check digit (which
#may be 'X' and ISBN-13 is made up of 12 digits plus a 
#check digit. Spaces and hyphens may be included in a code,
#but are not significant. This means that 9780471486480 is
#equivalent to 978-0-471-48648-0 and 978 0 471 48648 0.

def check_isbn(isbn)

	counter = 0
	index = 0
	isbn.length.times do
#		strip_nonnumeric(good)
		if isbn[index].to_i - isbn[index].to_i == 0
			counter += 1
#           			
		elsif (isbn[index] == "x" || isbn[index] == "X") && isbn.length == 10
			counter = 10							
   	 	end
   	 	index += 1
	end

	case counter
	when 10
		create_checksum_10
	when 13
	    create_checksum_13
	else    	
#       fail		
	end
end

#        




def create_checksum_13
#The check digit for ISBN-13 is calculated by multiplying
#each digit alternately by 1 or 3 (i.e., 1 x 1st digit,
#3 x 2nd digit, 1 x 3rd digit, 3 x 4th digit, etc.), summing
#these products together, taking modulo 10 of the result
#and subtracting this value from 10, and then taking the
#modulo 10 of the result again to produce a single digit.
  sum = isbn[1] * 1  +
  	 	isbn[2] * 3  +
  	 	isbn[3] * 1  +
  	 	isbn[4] * 3  +
  	 	isbn[5] * 1  +
  	 	isbn[6] * 3  +
  	 	isbn[7] * 1  +
  	 	isbn[8] * 3  +
  	 	isbn[9] * 1  +
  	 	isbn[10] * 3 +
  	 	isbn[11] * 1 +
  	 	isbn[12]   
end

def create_checksum_10(isbn)
#The check digit for ISBN-10 is calculated by multiplying
#each digit by its position (i.e., 1 x 1st digit, 2 x 2nd
#digit, etc.), summing these products together and taking
#modulo 11 of the result (with 'X' being used if the result
#is 10).
 
# Example of how the ISBN-10 sumcheck is calculated:
# first 9 digits of an isbn10: 742139476
# create checksum:
# sum = 1*7 + 2*4 + 3*2 + 4*1 + 5*3 + 6*9 7*4 + 8*7 + 9*6
  sum = isbn[1] * 1  +
  	 	isbn[2] * 2  +
  	 	isbn[3] * 3  +
  	 	isbn[4] * 4  +
  	 	isbn[5] * 5  +
  	 	isbn[6] * 6  +
  	 	isbn[7] * 7  +
  	 	isbn[8] * 8  +
  	 	isbn[9] * 9  
# sum = 7 + 8 + 6 + 4 + 15 + 54 + 28 + 56 + 54
# sum = 232
# checksum = 232%11
  sum  =  sum % 11
  if sum == 10 and (isbn[10] == "x" || isbn[10] == "X")
 #      pass
  end

# checksum = 1
# isbn = 7421394761 
# Add Comment	


end

def strip_nonnumeric


end



