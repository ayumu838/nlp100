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
            next if val == nil
            val = val.gsub("'","")
            if val.match(/\[/)
                puts val
                m = val[/\[{2,2}*\|{1,}(.*?)\]{2,2}/,1]
                t = m[/\|(.*?)$/,1] if m != nil
                m = t if t != nil
                val.gsub!(/\[{2,2}.*?\]{2,2}/,m) if m != nil
                val.gsub!(/\[|\]/,"")
                puts val
            end
            key = line[/\|(.*?)\=/,1]
            temp[key] = val if key != nil
        }
    end
}
# puts temp
