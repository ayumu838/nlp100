require 'json'

jsons = []
File.open('jawiki-country.json') do |f|
  f.each_line do |line|
    jsons << JSON.load(line)
  end
end
def remove_internal_link(val)
  if val =~ /\[{2,}/
    m = val[/\[{2,2}*\|{1,}(.*?)\]{2,2}/, 1]
    t = m[/\|(.*?)$/, 1] unless m.nil?
    m = t unless t.nil?
    val.gsub!(/\[{2,2}.*?\]{2,2}/, m) unless m.nil?
    val.gsub!(/\[|\]/, '')
  end
  val
end

def remove_external_link(val)
  m = val[/\[(.*?)\]/, 1]
  return val if m.nil?
  t = m.split(' ', 2)[1]
  val.gsub!(/\[(.*?)\]/, t) unless t.nil?
  val.gsub!(/\[(.*?)\]/, '')
  val.gsub!(/<.*?>/, '')
  p val
  val
end
temp = {}
jsons.each do |json|
  matchs = json['text'].tr("\n", '@')[/基礎情報(.*?)@\}\}/]
  next if matchs.nil?

  matchs.tr('@', "\n").each_line do |line|
    val = line[/\={1,}(.*?)\n/, 1]
    next if val.nil?
    val = val.delete("'")
    val = remove_internal_link(val)
    val = remove_external_link(val)
    p val
    key = line[/\|(.*?)\=/, 1]
    temp[key] = val unless key.nil?
  end
end
