lines = File.open('hightemp.txt', 'r').read.split("\n")

l = lines.length - ARGV[0].to_i
(lines.length - 1).downto(l) { |i| puts lines[i] }
