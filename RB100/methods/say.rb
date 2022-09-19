def say(words)
  puts words + '.'
end

say("hello dear")
say("what a goobly gook you are")


def say(words = 'hello') # a default parameter being set so it can be ran without any arguments being passed through.
  puts words + '.'
end

say()
say('no hello for you')
