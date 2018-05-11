str = 'Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics.'

str.gsub(/,|\./, '').split(' ').each { |s| print s.length }
