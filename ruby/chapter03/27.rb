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
    next if val.nil?
    val = val.delete("'")
    if val =~ /\[/
      m = val[/\[{2,2}*\|{1,}(.*?)\]{2,2}/, 1]
      t = m[/\|(.*?)$/, 1] unless m.nil?
      m = t unless t.nil?
      val.gsub!(/\[{2,2}.*?\]{2,2}/, m) unless m.nil?
      val.gsub!(/\[|\]/, '')
    end
    key = line[/\|(.*?)\=/, 1]
    temp[key] = val unless key.nil?
  end
end
puts temp
