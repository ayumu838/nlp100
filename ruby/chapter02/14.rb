lines = File.open("hightemp.txt","r").read.split("\n")

ARGV[0].to_i.times{|i| puts lines[i]}
