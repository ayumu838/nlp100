require 'json'

jsons = []
File.open('jawiki-country.json') do |f|
  f.each_line do |line|
    jsons << JSON.load(line)
  end
end

jsons.each do |json|
  print json['text'] if json['title'] == 'イギリス'
end
