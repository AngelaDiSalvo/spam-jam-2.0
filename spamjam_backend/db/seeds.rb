# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do
  User.create(name: Faker::Name.name, real_email: Faker::Internet.email)
end

4.times do
  Victim.create(name: Faker::Name.name, real_email: Faker::Internet.email)
end

# 5.times do
#   SpamType.create(name: Faker::Food.dish, template: Faker::Lorem.sentence(20))
# end

10.times do
  SpamEmail.create(contents: Faker::Lorem.sentence(5), user_id: Faker::Number.between(1,3), victim_id: Faker::Number.between(1,4), spam_type_id: Faker::Number.between(1,5))
end

10.times do
  FakeEmail.create(email: Faker::Internet.email, user_id: Faker::Number.between(1,3))
end

#====== ACTUAL SPAM TYPES ======

SpamType.create(name: "Social Media Expert" , template:" Hey
  I am called Scott and I specialize in Social network engagement marketing which helps to increase business and can give your facebook page a wow factor. I've emailed you just to let you know I have some very special deals on currently which ust might interest you as a business.

  <a href='spamjam.herokuapp.com/bam'>'See Offers!'</a>
  I help gain facebook likes and Twitter followers for business as a way to start increasing profits and immersion through social engagement. If a new client logs onto facebook or social media and sees that you have 23500000 likes over your competition's paltry 300, they will more likely throw money at you. This works for nearly any industry: Business, Marketing, Animation, Arson, Starving-Children, etc. As you can see by my credentials I'm 100% trustworthy and can make the changes your company needs. I will establish your brand as a trusted source.")

SpamType.create(name: "Lucky Winner" , template:" CONTRATULATIONS!!!

  You won a all-paid-for vacation package to Unspecifiedistan ($300,000,000,000 value! Wow!) Please send Name, Address, CC#, SS#, to <a href='spam-jam.herokuapp.com/bam'>JeezusChrist@HowGullible.com </a>

  You have 5 hours to redeem this amazing offer before it gets handed down to the next lucky winner! Act fast! Here in unspecifiedistan we have purely unadultured views of the desert mountain ranges! Come enjoy an unlimited buffet of white truffle, gold flakes, and caviar. The roalty, yes. Such a good offer. would be a shame if you missed out. All you have to do is provide the info mentioned above but most importantly

    CREDIT CARD INFO
    SOCIAL SECURITY

  We need this info to guarantee your safety.

  - Ug lee
  Administration Consultant Guru
  999-99-99999-9-92 Uganda
  how you write these addresses")

  SpamType.create(name: "FBI/CIA/IRS Arrest Warrant" , template:" Dear Sir or Madame,
    since your transaction of $1M USD has fallen through, the FBI has issued a warrant for your arrest for fradulent fund abuse(?) You need to act fast or agents will descend onto your household and destroy all your fine china. You wouldn't want that would you?

    Oh yeah, CIA also has a hit out on you because they can't be one-up'ed by the FBI. There's no telling what might happen. Please wire money to Flatiron. The got hackers there that can help you out. Please see the following for more INFO

    <a href='spamjam.herokuapp.com/bam'>'See Offers!'</a>

    You have 48 hours before the ninjas come get you.")

  SpamType.create(name: "Thirsty Code Camp" , template:"Hello Prospective Student,
    DevBasement has had the best record of awesome stuff related to coding. What's that? You want FULL STACK training? well we got STACKS! ALL THE STACKS! Our instructors are the most STACKED in the industry! Our codebase extends well beyong Java, C++, Ruby, C#... We at DevBasement teach practical code approaches such as PROFANITY and NOT-GIVING-A-****-ABOUT-BUGS v.2.3s. Come join us

    We will need the following:
    TELEPHONE
    NAME
    ARM & LEG
    FIRSTBORN
    YOUR OLD BATH WATER (for immersion)

    Start YOUR coding journey off strong. Learn things like How-to-win-at-arguements and Slack. We will slack off so hard even your future employers will think that you program like the undead. 120% program approval rating. such good. wow. learn to united states of stack today!

    <a href='spamjam.herokuapp.com/bam'>Start Slacking Hard Today!</a>

    DevBasement School
    some hole in the ground
    222-2222-22-2222")

  SpamType.create(name: "The Hookup Trap" , template: " Hey bb I thot ur cutexxx xoxoxo I am lonely please check out my insucurities here: <a href='spamjam.herokuapp.com/bam'>'Click For Pics!'</a> I wanna pour strawberry limeade all over you. let's talk mmmk xxxxoxoxoxxxoxoxxxoxxo -Lizzz")

#== written by kenny ==
  SpamType.create(name: "Kpop Recruiting" , template: "You have been selected to join boys transitioning to girls generation. Can you kimchi good? Lets have a good time and get some kbbq.")
#== written by Cindy ==
  SpamType.create(name: "Ugandan Prince" , template: "Hello Broda, I am King UsainBolt-Jankles de Knuckles XVII. I am contacting you on here because I want you to know da whey. Me and my bruddahz have gathered here to celebrate and honor our Queen Motha in all her glory. The wae to our Queen is through your bank account. *tongue clicks* please provide the following so we may follow da queen muddah to find da whey.

    Bank ACCT Routing #
    Full Name
    Passport
    meme library (if you do not hab dis, you do not know da whey)

    you can provide all de information by following <a href='spamjam.herokuapp.com/bam'>dis whey</a>.

  Our bruddahz thank you for your cooperation and da queen mutha shall lead us down the right whey. If you respond in time the queen muddah will gib you free toaster. Thank you, Bruddah.

  -Knuckles
  *tongue clicks**tongue clicks**tongue clicks**tongue clicks**tongue clicks**tongue clicks**tongue clicks*

    ")
