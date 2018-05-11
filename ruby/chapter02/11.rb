f = File.open("hightemp.txt","r")
fw = File.open("hightemp_w.txt","w")
fw.write(f.read.gsub(/\t/," "))
f.close
fw.close
