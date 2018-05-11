str = 'Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can.'
one_char_num = [1, 5, 6, 7, 8, 9, 15, 16, 19]
elements = {}
str.gsub(/,|\./, '').split(' ').each_with_index { |s, i| elements[i] = one_char_num.include?(i + 1) ? s[0] : s[0, 2] }

puts elements
