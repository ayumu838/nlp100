def cipher(str,op="encode")
    ans = []
    if op == "encode"
        str.each_char{ |c| c =  219 - c.ord if c.match(/[a-z]/); ans << c}
        return ans
    elsif op == "decode"
        str.each{|e| e = (219 - e).chr if e.is_a?(Integer); ans << e }
        return ans
    end
end

str = cipher("test@@VBNNEWQW&^ klj 123456")
p str
puts cipher(str,"decode").join("")
