require 'json'

jsons = []
File.open('jawiki-country.json') do |f|
  f.each_line do |line|
    jsons << JSON.load(line)
  end
end
jsons.each do |json|
  json['text'].each_line do |line|
    next unless line.include?('Category')
    m = line.match(/Category:/)
    m = m.post_match.match(/[\]|\}|\n]/)
    puts m.pre_match unless m.nil?
  end
end
