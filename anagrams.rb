def first_anagram?(string1, string2)
  letters = string1.split('').permutation.to_a
  letters.map! {|array| array.join('')}
  letters.include?(string2)
end

def second_anagram?(string1, string2)
  letters1 = string1.split('')
  letters2 = string2.split('')
  letters1.size.times do
    letter = letters1.pop
    if letters2.include?(letter)
      letters2.delete_at(letters2.index(letter))
    else
      return false
    end
  end
  letters2.empty?
end

def third_anagram?(string1, string2)
  letters1 = string1.split('').sort
  letters2 = string2.split('').sort

  letters1 == letters2
end

def fourth_anagram?(string1, string2)
  letters = Hash.new(0)
  string1.each_char do |char|
    letters[char] += 1
  end
  string2.each_char do |char|
    letters[char] -= 1
  end
  letters.values.all? {|value| value == 0}
end

p fourth_anagram?("elvis", "lives")
p fourth_anagram?("elvis", "liives")
