require 'json'

jsons = []
File.open("jawiki-country.json") { |f|
  f.each_line { |line|
      jsons << JSON.load(line)
  }
}
def remove_internal_link(val)
    if val.match(/\[{2,}/)
        m = val[/\[{2,2}*\|{1,}(.*?)\]{2,2}/,1]
        t = m[/\|(.*?)$/,1] if m != nil
        m = t if t != nil
        val.gsub!(/\[{2,2}.*?\]{2,2}/,m) if m != nil
        val.gsub!(/\[|\]/,"")
    end
    return val
end

def remove_external_link(val)
    m = val[/\[(.*?)\]/,1]
    return val if m == nil
    t = m.split(" ",2)[1]
    val.gsub!(/\[(.*?)\]/,t) if t != nil
    val.gsub!(/\[(.*?)\]/,"")
    val.gsub!(/<.*?>/,"")
    p val
    val
end
temp = {}
jsons.each { |json|
    matchs = json["text"].gsub("\n","@")[/基礎情報(.*?)@\}\}/]
    if matchs != nil

        matchs.gsub("@","\n").each_line {|line|
            val = line[/\={1,}(.*?)\n/,1]
            next if val == nil
            val = val.gsub("'","")
            val = remove_internal_link(val)
            val = remove_external_link(val)
            p val
            key = line[/\|(.*?)\=/,1]
            temp[key] = val if key != nil
        }
    end
}
