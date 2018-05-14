require 'json'

jsons = []
File.open("jawiki-country.json") { |f|
  f.each_line { |line|
      jsons << JSON.load(line)
  }
}

jsons.each { |json|
    json["text"].each_line { |line|
        if line.match(/File|ファイル:/)
            out = line[/File|ファイル:(.*?)\|/,1]
            puts out if out != nil
            if out == '120%"'
                p line
            end
        end
    }
}
