require 'json'

jsons = []
File.open("jawiki-country.json") { |f|
  f.each_line { |line|
      jsons << JSON.load(line)
  }
}

jsons.each { |json|
    json["text"].each_line { |line|
        if line.include?("Category")
            p line
        end
    }
}
