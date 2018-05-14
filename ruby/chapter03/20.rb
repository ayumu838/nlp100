require 'json'

jsons = []
File.open("jawiki-country.json") { |f|
  f.each_line { |line|
      jsons << JSON.load(line)
  }
}

jsons.each { |json|
    if json["title"] == "イギリス"
        print json["text"]
    end
}
