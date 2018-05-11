def random_word(word)
    r = [0]
    nums = []
    (1..(word.length - 2)).each{|i| nums << i}
    nums.shuffle!
    nums.each{|i| r << i}
    r << (word.length - 1)
    ans = []
    r.each{|i| ans << word[i]}
    return ans.join("")
end

str = "I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."

ans = []
str_list = str.split(" ")
str_list.each{|word| word = random_word(word) if word.length > 4; ans << word}

puts ans.join(" ")

# p str_list
