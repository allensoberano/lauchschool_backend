# 1. 
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty, BamBam Pebbles)

#2. 
flintstones << "Dino"

#3. 
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones.push("Dino").push("Hoppy")
flintstones.concat(%w(Dino Hoppy))
flintstones << "Dino" << "Hoppy"

#4.
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0, advice.index('house'))

#5.
statement = "The Flintstones Rock!"
statement.count('t')
statement.scan('t').count #used with multiple characters


#6. 
title = "Flintstone Family Members"
title.center(40)

