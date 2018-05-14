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
            m = line.match(/Category:/)
            m = m.post_match.match(/[\]|\}|\n]/)
            puts m.pre_match if m != nil
        end
    }
}
