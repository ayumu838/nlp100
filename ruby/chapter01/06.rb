def n_gram(str, n = 2)
  r = []
  if str.is_a?(Array)
    (str.length - (n - 1)).times { |i| r << str[i, n] }
    return r
  end
  (str.length - (n - 1)).times { |i| r << str[i, n] }
  r
end

X = n_gram('paraparaparadise')
Y = n_gram('paragraph')

puts '積集合'
puts X & Y

puts '和集合'
puts X | Y

puts '差集合'
puts X - Y

puts 'seが含まれているか'
puts 'X'
puts X.include?('se')

puts 'Y'
puts Y.include?('se')
