require 'json'

jsons = []
File.open('jawiki-country.json') do |f|
  f.each_line do |line|
    jsons << JSON.load(line)
  end
end
dic = {}
jsons.each do |json|
  json['text'].each_line do |line|
    next unless line =~ /={2,}*={2,}/
    key = line.gsub(/[\n|\=|\ ]/, '')
    val = line[/={2,}*?={2,}/, 0].length
    dic[key] = val
  end
end
p dic
