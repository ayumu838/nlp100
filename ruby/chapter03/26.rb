require 'json'

jsons = []
File.open('jawiki-country.json') do |f|
  f.each_line do |line|
    jsons << JSON.load(line)
  end
end

temp = {}
jsons.each do |json|
  matchs = json['text'].tr("\n", '@')[/基礎情報(.*?)@\}\}/]
  next if matchs.nil?

  matchs.tr('@', "\n").each_line do |line|
    val = line[/\={1,}(.*?)\n/, 1]
    val = val.delete("'") unless val.nil?
    key = line[/\|(.*?)\=/, 1]
    temp[key] = val unless key.nil?
  end
end
puts temp
