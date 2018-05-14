require 'json'

jsons = []
File.open("jawiki-country.json") { |f|
  f.each_line { |line|
      jsons << JSON.load(line)
  }
}
dic = {}
jsons.each { |json|
    json["text"].each_line { |line|
        if line.match(/={2,}*={2,}/)
            key = line.gsub(/[\n|\=|\ ]/,"")
            val = line[/={2,}*?={2,}/, 0].length
            dic[key] = val
        end
    }
}
p dic
