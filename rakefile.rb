
@temp = "temp"

task :site do
  clone
  if system("mvn site-deploy")
    push "deploying site"
    puts " site deployed successfully "
  else
    puts " site deployment failed "
  end
  clean
end

task :repo do
  clone
  if system("mvn release:perform")
    push "releasing artifacts"
    puts " artifact released successfully "
  else
    puts " could not release artifact "
  end
  clean
end

def clone
  puts `git clone -l -s -b gh-pages . ../#{@temp}`
end

def push(message) 
  puts `cd ../#{@temp} && git add -A && git commit -m "#{message}" && git push origin gh-pages`
  puts `git push origin gh-pages`
end

def clean
    puts `rm -r ../#{@temp}`
end
