#    Write a program that finds the longest repeated substring in any given text. The program should read the text from a file. Make whatever assumptions necessary.

content = File.readlines 'textfile.txt'

def longest_recurring_string(string)
  length = string.to_s.length
  # return length
  return string.to_s[02..60]
end

puts longest_recurring_string(content)
#Could'nt solve this one--below is my best notion, as pseudocode.




# PSEUDOCODE SOLUTION IDEA

# accept superstring

# check to see if character[0] of superstring repeats
# if yes, try character[0..1], see if it repeats

# else try character[1], to see if it repeats
#   if yes, try character[1..2]

# and so on...

# whenever we run out of repeats, put the latest repeater in an array

# at end of process, sort array to find longest repeater.

