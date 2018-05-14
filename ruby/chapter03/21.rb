require 'json'

jsons = []
File.open('jawiki-country.json') do |f|
  f.each_line do |line|
    jsons << JSON.load(line)
  end
end

jsons.each do |json|
  json['text'].each_line do |line|
    p line if line.include?('Category')
  end
end
