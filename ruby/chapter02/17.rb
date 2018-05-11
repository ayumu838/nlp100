lines = File.open('hightemp.txt', 'r').read.split("\n")
col1s = []
lines.each { |line| col1s << line.split(' ')[0] }
puts col1s.uniq
