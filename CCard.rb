# Write a program to do a credit card number check:

#    Given a string as input determine if the number is a valid credit card number and print the credit card type (or unknown).

#    Card patterns:

# ￼￼   Card Type    Begins With   Number Length

#    ----------------------------------------

#     AMEX         34 or 37      15

#     Discover     6011          16

#     MasterCard   51-55         16

#     Visa         4             13 or 16


def card_checker(number)
  puts "Your card is #{validify_number(number)}, and of card type #{type_finder(number)[0]}."
end


def type_finder(credit_card_number)

  #Find credit card number length
  cc_length = credit_card_number.to_s.length

  #turn the number into an array of integers
  number_array = credit_card_number.to_s.split(//).map{|number| number.to_i}

  #Find the card type and put into 'card type' array
  card_type = []

  if cc_length == 15 && number_array[0]==3 && (number_array[1]==4 || number_array[1]==7)
    card_type << "AMEX"

  elsif cc_length == 16 && number_array[0] == 6 && number_array[1] == 0 && number_array[2] == 1 && number_array[3] == 1
    card_type << "Discover"

  elsif cc_length==16 && number_array[0]==5 && (number_array[1]==(5 || 4 ) || (3 || 2) || 1)
    card_type << "MasterCard"

  elsif cc_length==(16 || 13) && number_array[0]==4
    card_type << "Visa"

  else
    card_type << "unknown"

  end
  return card_type

end

def validify_number(credit_card_number)

  #make two arrays for holding numbers to double or leave-alone
  nums_doubled = []
  nums_to_leave_alone = []

  #turn the number into an array of integers
  number_array = credit_card_number.to_s.split(//).map{|number| number.to_i}

  #reverse the numbers, so you can start from the other end, as per instructed,
  #and take every odd index, and leave alone,
  #take every even index, and double it
  number_array.reverse.each_with_index do |number,index|
    if (index %2 == 0) then
      nums_to_leave_alone << number
    else
      nums_doubled << number * 2
    end
  end

  #split numbers like "18" into 1 and 8, making a new array, with lots of 0's!!
  doubled_array_split = nums_doubled.to_s.split(//).map{|number| number.to_i}
  left_array_split= nums_to_leave_alone.to_s.split(//).map{|number| number.to_i}

  #find the sum of these new split arrays--
  total = (doubled_array_split.reduce( :+ ) + left_array_split.reduce( :+ ))

  #if the sum is divisble evenly by 10 (modulo 10), card is valid, print message
  if total %10 == 0
    return "valid"
  else
    return "invalid"
  end
end

puts "enter card number"
card = gets.chomp
puts card_checker(card)
