f = File.open("hightemp.txt","r")
puts f.read.gsub(/\t/," ")
