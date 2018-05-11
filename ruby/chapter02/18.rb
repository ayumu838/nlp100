lines = File.open('hightemp.txt', 'r').read.split("\n")
col3s = []
lines.each { |line| col3s << line.split(' ')[2] }
puts col3s.sort.reverse
