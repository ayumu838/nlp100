f = File.open('hightemp.txt', 'r')
fw = File.open('hightemp_w.txt', 'w')
fw.write(f.read.tr("\t", ' '))
f.close
fw.close
