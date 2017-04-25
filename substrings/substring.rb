dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
text = "Howdy partner, sit down! How's it going?"


def substrings a, dictionary
 input = a.downcase.split(/\W+/)
 result = Hash.new(0)
 dictionary.each do |a|
  input.each do |b|
    (b.include? a)? result[a] +=1 : nil
 end
 end
 return result
end

substrings text, dictionary
