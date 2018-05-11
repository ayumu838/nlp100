f = File.open('hightemp_w.txt', 'r')
col1 = []
col2 = []
f.each_line { |line| line = line.split(' '); col1 << line[0]; col2 << line[1] }

File.open('col1.txt', 'w') { |f| col1.each { |s| f.write(s + "\n");  } }
File.open('col2.txt', 'w') { |f| col2.each { |s| f.write(s + "\n");  } }
