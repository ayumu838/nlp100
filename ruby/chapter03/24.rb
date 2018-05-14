require 'json'

jsons = []
File.open('jawiki-country.json') do |f|
  f.each_line do |line|
    jsons << JSON.load(line)
  end
end

jsons.each do |json|
  json['text'].each_line do |line|
    next unless line =~ /File|ファイル:/
    out = line[/File|ファイル:(.*?)\|/, 1]
    puts out unless out.nil?
    p line if out == '120%"'
  end
end
