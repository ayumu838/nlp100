require 'json'

jsons = []
File.open("jawiki-country.json") { |f|
  f.each_line { |line|
      jsons << JSON.load(line)
  }
}

temp = {}
jsons.each { |json|
    matchs = json["text"].gsub("\n","@")[/基礎情報(.*?)@\}\}/]
    if matchs != nil

        matchs.gsub("@","\n").each_line {|line|
            val = line[/\={1,}(.*?)\n/,1]
            val = val.gsub("'","") if val != nil
            key = line[/\|(.*?)\=/,1]
            temp[key] = val if key != nil
        }
    end
}
puts temp
