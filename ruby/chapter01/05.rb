def n_gram(str,n=2)
    return (str.length - (n-1) ).times{|i| p str[i,n] } if str.kind_of?(Array)
    (str.length - (n-1) ).times{|i| p str[i,n]}
end

# 文字bi-gram
n_gram("I am an NLPer")

# 単語bi-gram
n_gram(%W(I am an NLPer))
