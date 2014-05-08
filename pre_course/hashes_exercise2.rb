# hashes_exercise2.rb
# Given

family1 = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"]
          }

family2 = { brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

p family1.merge(family2)

p family1

p family1.merge!(family2)

p family1
