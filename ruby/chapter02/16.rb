lines = File.open('hightemp.txt', 'r').read.split("\n")

n = ARGV[0].to_i
lines_list = (0..(n - 1)).to_a

split_count = (lines.length / n)
n += 1 if lines.length % n != 0
n.times { |i| p lines[i * split_count, split_count] }
