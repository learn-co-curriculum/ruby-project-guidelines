
require_relative '../config/environment'

def shelter_name
    font = TTY::Font.new("doom")
    pastel = Pastel.new
    puts pastel.red(font.write "Second")
    puts pastel.green(font.write "Chance")
    puts pastel.blue(font.write "Shelter")
    sleep(4,)
end
shelter_name
puts "Hello and Welcome to Second Chance Shelter!"
puts "Please enter your name:"
username = gets.chomp.downcase
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
puts "Hello #{username}! We will be asking you some questions in hopes to better match you with your new forever furry friend!"
sleep(2,)
puts "Do you have any allergies? yes or no"
def aller_dogs
    user_input = gets.chomp.downcase
        
    if user_input == "no"
        Dog.all.select do |dog|
            Dog.all 
            puts "Name: #{dog.name}, Breed: #{dog.breed}"
        end
    
    elsif user_input == "yes"
        h_dogs = Dog.hypo_dog(user_input)
            h_dogs.each do |dog|
        
        puts "Name: #{dog.name}, Breed: #{dog.breed}"
        end    
    end
end
aller_dogs  
     # Dog.all.select do |dog|
    #         Dog.all.hypoaller == "yes"
    #    puts "Name: #{dog.name}, Breed: #{dog.breed}" 
    #     end
        