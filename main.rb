require 'bundler'
Bundler.require

f = File.open("words.txt")
content = f.read
f.close

$words = content.split(", ")

def randomwords(x)
  randomwords = Array.new
  x.times do
    word = $words[rand($words.length)]
    randomwords.push(word)
  end
  randomwords
end

def randomsentence
  randomwords(8).join(' ').capitalize + "."
end

def sentences(n)
  sentences = Array.new
  n.times do
    sentences.push(randomsentence)
  end
  sentences.join(' ')
end

def paragraphs(t)
  paragraphs = Array.new
  t.times do
    paragraphs.push(sentences(8))
  end
    paragraphs.join ('<br><br>')
end

def pages(z)
  pages = Array.new
  z.times do
    pages.push(paragraphs(8))
  end
  pages
end

get '/' do
  erb :main
end

post '/' do
  s = params[:sentences].to_i
  p = params[:paragraphs].to_i
  z = params[:pages].to_i
  if s == 0 and p == 0 and z == 0
    @no = sentences(5)
  end
  @s = sentences(s)
  erb :result
  @p = paragraphs(p)
  erb :result
  @z = pages(z)
  erb :result
end