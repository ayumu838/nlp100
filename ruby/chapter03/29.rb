require 'net/http'
require 'uri'
require 'json'


jsons = []
File.open("jawiki-country.json") { |f|
  f.each_line { |line|
      jsons << JSON.load(line)
  }
}
files = {}
jsons.each { |json|
    json["text"].each_line{ |line|
        if line.match("国旗画像")
            filename = line[/\ {0,}=(.*?)$/,1]
            filename.gsub!(/^\ {1,}|\|/,"")
            files[json["title"]] = filename
        end
    }
}

files.each{ |k,v|
    url = "https://en.wikipedia.org/w/api.php?"\
            + "action=query"\
            + "&format=json"\
            + "&prop=imageinfo"\
            + "&titles=File:" + v\
            + "&iiprop=url"
    uri = URI.parse(url)
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)
    puts "#{k}:#{result}"
    url = result["query"]["pages"]["-1"]["imageinfo"][0]["url"]


    # puts url

}
# uri = URI.parse('http://www.example.com/sample.json')
# json = Net::HTTP.get(uri)
# result = JSON.parse(json)
# puts result
