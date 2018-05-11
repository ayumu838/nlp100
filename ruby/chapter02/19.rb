lines = File.open('hightemp.txt', 'r').read.split("\n")
col1s = []
counts = Hash.new(0)
lines.each { |line| col1s << line.split(' ')[0] }
col1s.each { |e| counts[e] += 1 }
p counts.sort_by { |_k, v| v }.reverse
