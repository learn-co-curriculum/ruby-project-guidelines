def run
    shelter_name
    greeting
    system "clear"
    hypo_or_not
    call_dog_bio
end
def shelter_name 
    font = TTY::Font.new("doom")
    pastel = Pastel.new
    puts pastel.yellow(font.write "Second") 
    puts pastel.cyan(font.write "Chance") 
    puts pastel.magenta(font.write "Shelter") 
    sleep(4,)
end 
def greeting
    puts "Welcome to Second Chance Shelter,\nOur goal is to make this shelter the first place, potential adopters turn to when looking to get a new dog,\n ensuring that all of our dogs find loving and caring homes."
    sleep(6,)
    prompt = TTY::Prompt.new
    x = prompt.ask("Let's begin your journey!\nWhat is your name?")
    $CURRENTUSER = User.find_or_create_by(name: x)
    sleep(2,)
    puts ("Welcome #{$CURRENTUSER.name}! We have just one more question to ask :)")
    sleep(3,)
end
def hypo_or_not
    puts "Do you have any allergies? Yes or No"
    user_input = gets.chomp.downcase.strip 
    case user_input
    when "yes"
        puts "Here's a list of hypoallergenic dogs we have in our shelter!"
        sleep(2,)
        hypo_dogs
    when "no"
        puts "Here is the list of dogs that await your arrival!"
        sleep(2,)
        not_hypo_dogs
    else 
        puts "Invalid, try again"
        hypo_or_not
    end
end
def not_hypo_dogs
    Dog.all.select do |dog|
        puts "Name: #{dog.name}, Breed: #{dog.breed}, Age: #{dog.age}"
    end
end
def hypo_dogs
    h_dogs = Dog.hypo_dog("yes")
    h_dogs.each do |dog|
        puts "Name: #{dog.name}, Breed: #{dog.breed}, Age: #{dog.age}"
    end 

end
def call_dog_bio
    
    puts "Enter the name of the dog you'd like to know more about!"
    name_input = gets.chomp.capitalize.strip 
    
    selected_dog = Dog.all.find do |dog|
        dog.name ==  name_input 
    end 
    system "clear"
    puts "
                                          ```````
                             `.--://++/+osssyysssoo+++///:-.`
                         `-/osyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyss+:.
                      `-+syyyyyyyyyyyyyyys+/:::/oyyyyyyyyyyyyyyyyo:.
                    `:syyyyyyyyyyyyyyyy+-`       .:syyyyyyyyyyyyyyys+.
                   -syyyyyyyyyyyyyyyy+.            `:syyyyyyyyyyyyyyyy/`
                 `+yyyyyyyyyyyyyyyys-                `+yyyyyyyyyyyyyyyys-
                .syyyyyyyyyyyyyyyy+`                   :yyyyyyyyyyyyyyyyy/
               .syyyyyyyyyyyyyyyy/`                     .syyyyyyyyyyyyyyyy/
              .syyyyyyyyyyoyyyyy:                        `oyyyyosyyyyyyyyyy/
             `syyyyyyyyys/yyyyy:                          `oyyyy/oyyyyyyyyyy-
             .yyyyyyyyys-yyyyy/    ```               ``    .syyyy:oyyyyyyyyy+
              -syyyyyys.oyyyy+    /syo`            `oys/    -yyyys.oyyyyyyy+`
               `:oyyyy.:yyyyy`    +yys`            `syy+     +yyyy+.syyys+.
                  .-:-`syyyy/      ``                ``      `yyyyy--/:.`
                      -yyyyy.                                 oyyyyo
                      +yyyys`                                 /yyyyy`
                      oyyyys`         `.:://++/::-.           :yyyyh`
                      oyyyyy`       -syyyyyyyyyyyyyy+         +yyyyy.
                      oyyyyy:       yyyyyyyyyyyyyyyyy:       `syyyyh`
                      /yyyyyy`      oyyyyyyyyyyyyyyyy.       /yyyyys`
                `.--` .yyyyyys`     `syyyyyyyyyyyyyy:       :yyyyyy/ -:::.
              `+yyyys- :yyyyyys-     `:syyyyyyyyyy+.      .oyyyyyyo`/yyyyys-
              oyyyyyyy/..oyyyyyyo-`    `-+syyyyo:`      .+yyyyyys/.+yyyyyyys`
             `yyyyyyyyyyo:::/osyyys/.     ``..`      .:ooo++/::::+yyyyyyyyyy`
              -syyyyyyyyyyyyso+//////-.............--:::///+osyyyyyyyyyyyys-
               `oyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyo`
                .yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy:
                /yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyo`
             `:oyyyyyyyyyysssssssoooooo++++++++++++ooo+ooooossyyyyyyyyyyyyo.
            :syyyyyyyyyyo..``````````:+ooooooooooooo/`   `````.:oyyyyyyyyyys-
           `yyyyyyyyyyyy/             `.:/+ossso+:-`             -yyyyyyyyyyy.
            syyyyyyyyyys`                  ````                   -syyyyyyyyy/
            -syyyyyyyyo.                                           `/syyyyyyo`
             .-/+oso+-`                                              `.-:/:-`                    "
            sleep(3,)
    puts "Bio: #{selected_dog.bio}"  
    sleep(5,)
    puts "Name: #{selected_dog.name}, Breed: #{selected_dog.breed}, Age: #{selected_dog.age}, Weight: #{selected_dog.weight} \n Energy Level: #{selected_dog.energy_level}" 
    outcome 
 end 



def outcome
    prompt = TTY::Prompt.new
    choices = ["Yes, I want to Adopt!", "I want to keep searching", "I think I want a cat instead"]
    user_choice = prompt.select("Is it a match?", choices)
    case user_choice
    when "Yes, I want to Adopt!"
        yay_adopted
    when "I want to keept searching"
        hypo_or_not
        call_dog_bio
    when "I think I want a cat instead"
        goodbye
    end
   
end
def yay_adopted
    puts "                                                                                                    
                 ```/+/::-`....--:/+ohy                     ` oss/:/-..:-:/:/+o```                   
              ..so:-.``           ``.:/o+`` `           ``/h+::-``          ``.-:o:.`                
            .-so/.         ```````     `-/oso.         :++/.`                    `-/s/.              
            oo:`      `.://o.``..`+/-.`   `:yhy      `o+-`   `.-:/++o/:+::..`       ./y.             
         `o//`     `-++-....      ...-o/.`  `/yss  `//-`  .:/:.....--.-...`.+/.`      -/+            
         -h:     `/sy+:               .:ss:`  .os :+:`  .o+/-`````````      /+so-      `:o:          
        so-     .so+.                   :/yy:` `/sy-  .+y/:`oyy+-.-:sss`      -/s+.      ::          
       `s:     -+o-                       //os-  /- `/y/: :y+/.     `-+s+       -:/-      :o/`       
     .ys/     -h/                           ./o/   .o/:   :s.         `o+     `   -y+.`   `oh-       
     `hh.    `+/.                             :+:`.sy-   ./.           -/    `oooooooss/.` :h-       
      ds     :o`                               `osso+  `:+:             +   oys/:.```.-/os-`+/-      
      h:    `s+-                            //-:dds:-   .+.             o .++:`         :sho+sd      
      /-    -o:`                          -oss:.``-/o/- /+`            `+s++`            +so/:/      
      :-    :d-                           :y-       `:ooss.            -sy:              o+          
      :-    :h-                         `o/`          -yNs:           `od/              -s/          
     `+-    /y-                         o+.            +h/+`         `+s+               /y+          
     `y/    :y-                         d/             :o -o-       -smh/              +y            
     `oy.   `y/.                        s:             -s :ys+----/+:.+y.            `/s+            
     `ss+`   :o/:                       N+             /s   ` ``ss/`  `//          `/os.             
       `d+`   :d/                       +s:           `yo              `++.     `-/sh:......---`     
        so/`   -//-                      :/-         .oyo:::---.----:/../oos::.+oyo+:..    .-sy-     
         `so.   `+o/`                     -s/-`    ./ydoyo+:-..```../sy/. `. .-//-`           /-     
          ..+o.   .o/++:.                 ``+yo+:-+dyo/.`             -ss`  .:++`             :-     
            sh//.`  `-+y+-`                  `.--.-:.                  `/s/ +m:               /.     
            `` -so-.   `:+/:-.              `-+y/.                       +/ oo`              .+.     
                `-/o+:`   `:+o//:         .:oy/-                         `:/o+              `oh`     
                  `.hdo/-`  `.:yo-`       :h+.                            .ss+            `:o+/      
                    ..`.o/:.`  `./:-..`   -+`                              :dh:`       `.-oo.`       
                        ````oo/.` `./o/-. :/                               `+////----:sso ``         
                            --sho:.  `-++-yo`                               :+-.`:--..-.`            
                              -...s/-`  `:yyo-                              -o:.                     
                                  ..++:.  `/ss+-`````                       :/                       
                                    ``sho.  .+s:o+++////::`                 -:                       
                                      -/ds+.  :so./h/.`.+hss:`              ::                       
                                       ...sy+` `/ys-   -o-:+:--`           `/:                       
                                         `.++- `-`  `:-.     .//.```     `+.`                       
                                            `.o/    --`        ````//+//::-`                         
                                             `yho` :/:                                               
                                              -+sso-`                                                
                                                -::                                                  
                                                                            "

    sleep(2,)
    puts "Hooray!!! For Adoption Day!!!!"
    goodbye
end
def goodbye
    sleep(2,)
    puts "Type 'exit' to quit, or 'back' to return to the main menu"
    input = gets.chomp.downcase
    case input
    when "exit"
        puts "Thank you so much for coming to Second Chance Shelter! \n Where every being deserves a second chance at love <3 \n Adopt, don't shop!"
    when "back"
        shelter_name
    else
        puts "Invalid choice, try again."
        goodbye
    end
end





