dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
  string_arr = string.split
  string_arr.reduce(Hash.new{0}) do |result, word|
    dictionary.each do |value|
      next unless value.include?(word)
      result[word] +=1
      result
    end
  end
end

substrings("Howdy partner, sit down! How's it going?", dictionary)