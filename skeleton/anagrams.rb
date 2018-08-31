def first_anagram?(word1,word2)
  words = permutations(word1.chars)
  words.include?(word2.chars)
end

def permutations(array)
  return [array] if array.length <= 1
  value = array.shift
  
  perms = permutations(array)
  total_perms = []
  
  perms.each do |perm|
    (0..perm.length).each do |i|
      total_perms << perm.take(i) + [value] + perm.drop(i)
    end
  end
  
  total_perms
end

def second_anagram?(word1,word2)
  word2 = word2.chars
  word1.each_char do |letter|
    idx = word2.index(letter)
    word2.delete_at(idx)
  end
  word2 == []
end

def third_anagram?(word1,word2)
  word1.chars.sort == word2.chars.sort
end

def fourth_anagram?(word1,word2)
  word1_hash = Hash.new(0)
  word1.chars.each {|letter| word1_hash[letter] += 1}
  word2.chars.each {|el| return false if word1_hash[el] < word2.count(el)}
  true
end

def fourth_anagram2?(word1,word2)
  count = Hash.new(0)
  word1.chars.each {|letter| count[letter] += 1}
  word2.chars.each {|letter| count[letter] -= 1}
  count.values.all? {|v| v == 0}
end