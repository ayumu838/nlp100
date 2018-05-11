col1 = File.open("col1.txt","r").read.split("\n")
col2 = File.open("col2.txt","r").read.split("\n")

fw = File.open("cols.txt","w")
col1.length.times {|i| fw.write("#{col1[i]}\t#{col2[i]}\n")}
