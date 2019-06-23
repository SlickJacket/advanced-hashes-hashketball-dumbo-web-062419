require "pry"

def game_hash
  teams = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players:
        {"Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1,
        },
         "Reggie Evans" => {
           number: 30,
           shoe: 14,
           points: 12,
           rebounds: 12,
           assists: 12,
           steals: 12,
           blocks: 12,
           slam_dunks: 7
         },
         "Brook Lopez" => {
           number: 11,
           shoe: 17,
           points: 17,
           rebounds: 19,
           assists: 10,
           steals: 3,
           blocks: 1,
           slam_dunks: 15
         },
         "Mason Plumlee" => {
           number: 1,
           shoe: 19,
           points: 26,
           rebounds: 11,
           assists: 6,
           steals: 3,
           blocks: 8,
           slam_dunks: 5
         },
         "Jason Terry" => {
           number: 31,
           shoe: 15,
           points: 19,
           rebounds: 2,
           assists: 2,
           steals: 4,
           blocks: 11,
           slam_dunks: 1
         }

      }


    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players:
        {"Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
         "Bismack Biyombo" => {
           number: 0,
           shoe: 16,
           points: 12,
           rebounds: 4,
           assists: 7,
           steals: 22,
           blocks: 15,
           slam_dunks: 10
         },
         "DeSagna Diop" => {
           number: 2,
           shoe: 14,
           points: 24,
           rebounds: 12,
           assists: 12,
           steals: 4,
           blocks: 5,
           slam_dunks: 5
         },
         "Ben Gordon" => {
           number: 8,
           shoe: 15,
           points: 33,
           rebounds: 3,
           assists: 2,
           steals: 1,
           blocks: 1,
           slam_dunks: 0
         },
         "Kemba Walker" => {
           number: 33,
           shoe: 15,
           points: 6,
           rebounds: 12,
           assists: 12,
           steals: 7,
           blocks: 5,
           slam_dunks: 12
         }

      }


  }

  }
end

# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#     team_data.each do |attribute, data|
#       #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#       binding.pry
#
#       #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
#       data.each do |data_item|
#           binding.pry
#       end
#     end
#   end
# end
#
# good_practices

#Helper Method that combines the players from both :home and :away
def players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

#This also works as a Helper Method that collects the stats of a player
def player_stats(playerName)
  players[playerName]
end

#num_points_scored takes advantage of the stats helper method to iterate through the player's
#nested hash of stats to find and display the :points of that player
def num_points_scored(playerName)
  player_stats(playerName)[:points]
end

#shoe_size also uses the stats method to find the shoe size of particular player
def shoe_size(playerName)
  player_stats(playerName)[:shoe]
end

 #Helper Method that outputs the teams
 def teams
   game_hash.values
 end

 #Helper Method that finds and selects a team by searching through the keys for the symbol(key)
 #:team_name and then confirms that its value is equal to argument given when called, Then
 #returns with that team and its values
 def teamSelect(teamName)
   teams.find do|key|
     key[:team_name] == teamName
   end
 end

#Utilizes the teamSelect helper method to associate the correct :colors key and returns the
#array of colors associated with that key
 def team_colors(teamName)
   teamSelect(teamName)[:colors]

 end

#Uses the teams helper method and collects the keys :team_names into an array while returning that array
def team_names
  teams.collect do|key|
    key[:team_name]
  end
end

#Using the teamSelect helper Method, we can select a particular team's play numbers by starting our loop
#at the selected team, then going into the players of that team to collect their stats. stats[:number] returns
#only the stats from the players with the key :number
def player_numbers(teamName)
  teamSelect(teamName)[:players].collect do|name, stats|
    stats[:number]
  end
end

#Breaking the method down with this helper method to find the person with the largest shoe size
#using the .max_by method to select the stats[:shoe] size that is the largest
def biggestShoes
  players.max_by do|name, stats|
    stats[:shoe]
  end
end
