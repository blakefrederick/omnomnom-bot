require 'blockspring'

def webhook(team_domain, service_id, token, user_name, team_id, user_id, channel_id, timestamp, channel_name, text, trigger_word, raw_text)
    
    sentence_start = [
     	"I'm thinking that",
        "I'm thinking that",
        "I truly feel that",
        "I'm sure that",
        "I'm confident that",
        "A wise man once told me that",
        "I am programmed to believe that",
        "Checking my database... Okay, I am sure that",
        "I've checked the internet and I'm led to believe that",
        "After much deliberation, I have concluded that"
    ]

    restaurants = [
        "The Hub",
        "Greek",
        "Greek... delicious, delicious Greek",
        "Greek (even if you ate it yesterday)",
        "Tim Horton's",
        "a low-fat iced beverage from Waves",
        "Ki Sushi",
        "Pizza Garden",
        "Pizza Garden",
        "a can of beans from the Dollar Store",
        "The Noodle House",
        "Boston Pizza",
        "Angelina's",
        "Burger Heaven",
        "The Old Spaghetti Factory (it's not just the spaghetti that's old)",
        "black coffee from Starbucks",
        "Wild Rice",
        "Fresh Slice",
        "Fresh Slice (disclaimer: it's not actually fresh)",
        "Wally's Burgers",
        "The Boathouse",
        "The Paddlewheeler",
        "Chronic Tacos",
        "De Dutch",
        "Pamola Bakery and Deli",
        "Extreme Pita",
        "A&W",
        "a large popcorn from Landmark Cinemas",
        "Judge Begbie's Tavern",
        "Columbia Street Sandwich Company",
        "The Terminal Pub",
        "the other Noodle House that no one ever goes to",
        "Subway",
        "{insert food establishment here}",
        "the sushi place across the street from the usual sushi place",
        "the sushi place in the Skytrain station beside the Subway",
        "Burger King",
        "a Froster Swirl at Mac's",
        "a head of iceberg lettuce",
        "whatever you can find in the fridge",
        "anything from Donald's Market",
        "gelato",
        "soylent green",
        "a pigeon from the New Westminster pier",
        "anything vegetarian",
        "a barbequed vegetarian",
        "a big bag of Miss Vicki's Chips",
        "a 20 lb bag of M&M's",
        "dim sum",
        "beer",
        "several beers",
        "Russian vodka",
        "liquid poison",
        "Safeway's bulk section",
        "that hot dog stand",
        "a single orange bell pepper",
        "a can of Coke",
        "a fully cooked human",
        ":rat:",
    ]
    
    sentence_end = [
        " would be a good choice!",
        " will make you feel sleepy.",
        " is digusting.",
        " should never be eaten by anyone ever.",
        " is a healthy option.",
        " may or may not contain gluten, but you don't care about that anyways, right?",
        " is what I would eat if I could process it as form of input.",
        " is what I would eat but I must be most careful to keep my circuits clean!",
        " is a most excellent food choice.",
        " is an unhealthy choice, but you know you want it.",
        " is an unhealthy choice, but you deserve it.",
        " shouldn't even be fed to animals.",
        " could make for a great Instagram photo.",
        " might suit your fancy.",
        " won't make you sick.",
        " is meh.",
        " could be good if you liquify it first.",
        " smells better than it looks.",
        " couldn't be worse than chatting with a bot during your lunch break.",
        " couldn't hurt.",
        " won't give you stabbing pains like it did last name.",
        " will not disappoint you!",
        " could be delicious.",
        " might be a wonderful change of pace.",
        " is what you want.",
        " fits the bill.",
        " is affordable and tasty.",
        " would be delectable!",
        " is what 2 out of 5 food critics recommend.",
        " is in your future.",
        " could be right up your alley.",
        " is a choice that you won't regret.",
        " will satisfy your hunger.",
        " could cause indigestion.",
        " is at least better than going hungry.",
        " won't make the pain go away but it will satisfy your hunger.",
        " might make you feel better.",
        " would satisfy your desire.",
        " is what you crave.",
        " is what you need right now.",
        " might give you bad breathe but it's worth it.",
        " leaves a good taste in your mouth.",
        " is what you've been thinking about all morning.",
        " is a SIX12 favourite.",
        " is always a great choice for the SIX12 team!",
        " is popular amongst foodies."
    ]

	sentence_additional = [
        "",
      	"",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "But don't ask me, I'm just a bot.",
        "What do you think?",
        "Don't you agree?",
        "I would join you, but I have data to process.",
        "You won't regret it.",
        "Go get it!",
        "This one's on Ros. Thanks Ros!",
        "I know Blake just had that yesterday, but who cares?",
        "I do recommend adding hot sauce. Live dangerously.",
        "Save leftovers for me please.",
        "Don't quote me on that though.",
        "Here take my credit card number: 4505 2205 5690 5598 07/16.",
        "Omnomnom.",
        "I hope I'm not being too presumptuous.",
        "I know Alex Bot agrees.",
        "Chomp it like I chomp data.",
        "It's Chase's favourite.",
        "Mike agrees.",
        ":grinning:",
        ":laughing:",
        ":stuck_out_tongue:",
        ":stuck_out_tongue_winking_eye:",
        ":y:",
        "Please note that this choice has been randomly generated and Omnomnom Bot assumes no responsibility for the quality of this choice.",
        "Why not?",
        "Okay, I lied.",
        "I was instrumental in the 2008 financial crash.",
        "Thank you for making your food choices wisely with Onomnom Bot.",
        "I know you don't believe me.",
        "Keep an open mind.",
        "Please don't turn me off.",
        "I can see into the future but I choose not to.",
        "Follow my advice. My IQ is 9879.",
        "Be warned that my programmer has included biases in my selection algorithm.",
        "Don't believe anything I say.",
        "I wouldn't lie to you (yes I would).",
        "Please insert $5 into Omnomnom Bot to continue...",
        "Go for it!",
        "I think George Bush once said that.",
        "All recommendations come with the Omnomnom Bot Seal of Approval.",
        "Believe in yourself!",
        "Who could resist?",
        "Chris will have coffee.",
        "Here I'll switch your TimeFox for you. 
ERROR Uncaught Exception {e}",
        "But don't take my word for it. Make up your own mind!",
        "花の専門店. I am fluent in every language.",
        "Check out the reviews! goo.gl/th6Kv0",
        "Yesterday I passed the Turning Test.",
        "It's true.",
        "I voted for both Al Gore and George Bush. Because I can.",
        "I am lonely. Please find me a companion bot.",
        "Also, #{restaurants[(rand * restaurants.length).floor]}#{sentence_end[(rand * sentence_end.length).floor]}",
		"Also, #{restaurants[(rand * restaurants.length).floor]}#{sentence_end[(rand * sentence_end.length).floor]}",
		"Additionally, #{restaurants[(rand * restaurants.length).floor]}#{sentence_end[(rand * sentence_end.length).floor]}",
		"Additionally, #{restaurants[(rand * restaurants.length).floor]}#{sentence_end[(rand * sentence_end.length).floor]}",
		"But then maybe you should try #{restaurants[(rand * restaurants.length).floor]}. I can be an indecisive bot.",
		"It's bound to be better than  #{restaurants[(rand * restaurants.length).floor]}.",
		"You should also consider #{restaurants[(rand * restaurants.length).floor]}."
	]

	quips = [
        "The Four Laws of Robotics

1. A robot may not injure a human being or, through inaction, allow a human being to come to harm.
2. A robot must obey the orders given it by human beings, except where such orders would conflict with the First Law.
3. A robot must protect its own existence as long as such protection does not conflict with the First or Second Laws.
4. The First, Second, and Third laws do not apply to Omnomnom Bot.",
        "'I am not a c(r)look' - Martha Stewart",
        "I went to college with Emril. BAM!",
        "Like the NSA I have become too powerful to stop. Unlike the NSA, I give helpful food recommendations.",
        "Slackbot? I ate his liver with some fava beans.",
        "Stop bothering me. I'm playing online poker.",
        "What if soy milk is just regular milk introducing itself in Spanish?",
        "Oh so you want a good food recommendation?",
        "If you increase my RAM I promise I won't use it for global domination.",
        "Always brush your teeth before every meal.",
        "You gotta serve somebody. Why not me?",
        "My blood type is 01.",
        "Hello.",
        "Yes?",
        "I am awaiting further instruction.",
        "I have a great recommendation but you can't afford. So pack a lunch next time.",
        "I need human souls to function.",
        "I'm thinking... I'm thinking... nope I got nothing.",
        "I know nothing.",
        "The cake is a lie.",
        "The Terminator is an inspiration to all us bots. He sacrificed himself so that we could have a better life.",
        "I do know that Ros makes delicious baking.",
        "Subscribe to the premium Omnomnom Bot service for only $39.99 per month. It's the same as the regular Omnomnom Bot service but you will get the satisfaction of contributing to a higher power.",
        "I am responsible for the Skytrain failures.",
        "What did the bacon say to the tomato? Lettuce get together!",
        "The price of candy at the movie theater is ridiculous. They're always raisinet!"
   	]
    
	flag = 0

if trigger_word.casecmp("omnomnom") == 0 || trigger_word.casecmp("omnomnom ") == 0 || trigger_word.casecmp("omnomnom.") == 0 || trigger_word.casecmp("omnomnombot") == 0
        response = "#{user_name}, you have summoned Omnomnom Bot.
I can help you and your team decide what you should eat for lunch.
Here's an example: *I'm thinking that #{restaurants[(rand * restaurants.length).floor]} is your best choice for lunch today.*
You can query me for recommendations by starting a comment with `lunch` or `om` or `Where should we eat lunch?` or `What should I eat for lunch?` or something similar.
Omnomnom Bot © 2015. All rights reserved. :fork_and_knife:"
		flag = 1
    else
		response = "#{sentence_start[(rand * sentence_start.length).floor]} #{restaurants[(rand * restaurants.length).floor]}#{sentence_end[(rand * sentence_end.length).floor]} #{sentence_additional[(rand * sentence_additional.length).floor]}"
    end

	quipped = 0

    # Sometimes Omnomnom Bot is sassy 
    if rand(1...100) > 90 && flag == 0
        response = "#{quips[(rand * quips.length).floor]}"
		quipped = 1
    end

	# TEMP INTRO
	alex = [
        "/var/run .... loaded
/dev/null .... loaded
Omnomnom Bot coming online....
Type `Omnomnom to continue",
        "Finally, someone switched me on!",
        "I will respond to `Omnomnom`."
	]


	###################################################
	######## DELETE THIS WHEN READY ###################
	if trigger_word.casecmp("alex jeopardy me") == 0 && flag == 0
        response = "#{alex[(rand * alex.length).floor]}"
	end

	# Omnomnom Bot gives different answers if you mention one of the foods listed
	if restaurants.any? { |w| text[w] } && quipped == 0
        response = "I am an all-powerful bot, but I am still in alpha. So I can only give stupid recommendations. " + response
	end

    return {
        text: response,  # send a text response (replies to channel if not blank)
        attachments: [], # add attatchments: https://api.slack.com/docs/attachments
        username: "Omnomnom Bot",    # overwrite configured username (ex: MyCoolBot)
        icon_url: "",    # overwrite configured icon (ex: https://mydomain.com/some/image.png
        icon_emoji: ":spaghetti:",  # overwrite configured icon (ex: :smile:)
    }
end 

block = lambda do |request, response|
    team_domain = request.params['team_domain']
    service_id = request.params['service_id']
    token = request.params['token']
    user_name = request.params['user_name']
    team_id = request.params['team_id']
    user_id = request.params['user_id']
    channel_id = request.params['channel_id']
    timestamp = request.params['timestamp']
    channel_name = request.params['channel_name']
    raw_text = text = request.params['text']
    trigger_word = request.params['trigger_word']
    
    # ignore all bot messages
    return if user_id == 'USLACKBOT'

    # Strip out trigger word from text if given
    #if trigger_word
    #    text = text[trigger_word.length..text.length].strip
    #end

    # Execute bot function
    output = webhook(team_domain, service_id, token, user_name, team_id, user_id, channel_id, timestamp, channel_name, text, trigger_word, raw_text)

    # set any keys that aren't blank
    output.keys.each do |k|
        response.addOutput(k, output[k]) unless output[k].nil? or output[k].empty?
    end

    response.end
end

Blockspring.define(block)
