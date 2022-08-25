dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
  result = Hash.new(0)
  string_arr = string.downcase.split
  string_arr.each do |match|
    dictionary.each do |word|
      if match.include?(word)
        result[word] += 1
      end
    end
  end
  result 
end

p substrings("Howdy partner, sit down! How's it going?", dictionary)