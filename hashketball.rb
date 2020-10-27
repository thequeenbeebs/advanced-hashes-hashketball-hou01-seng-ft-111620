# Write your code below game_hash
require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def num_points_scored(name)
  game_hash.each do |team, team_info|
    game_hash[team].each do |team_info, inner_values|
      if team_info == :players
        game_hash[team][:players].each do |index|
          if name == index[:player_name]
            return index[:points]
          end
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |team, team_info|
    game_hash[team].each do |team_info, inner_values|
      if team_info == :players
        game_hash[team][:players].each do |index|
          if name == index[:player_name]
            return index[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, team_info|
    if team_name == team_info[:team_name]
      return team_info[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |team, team_info|
    teams.push(team_info[:team_name])
  end
  teams
end

def player_numbers(team)
  team_numbers = []
  game_hash.each do |home_or_away, team_data|
    if team_data[:team_name] == team
      game_hash[home_or_away].each do |team_data, inner_values|
        if team_data == :players
          game_hash[home_or_away][:players].each do |index|
            team_numbers.push(index[:number])
          end
        end
      end
    end
  end
  team_numbers
end

def player_stats(name)
  game_hash.each do |home_or_away, team_data|
    game_hash[home_or_away].each do |team_data, inner_values|
      if team_data == :players
        game_hash[home_or_away][:players].each do |index|
          if index[:player_name] == name
            return index
          end
        end
      end
    end
  end
end

def most_points_scored
  most_points = 0
  points_player = ""
  game_hash.each do |home_or_away, team_data|
    game_hash[home_or_away].each do |team_data, inner_values|
      if team_data == :players
        game_hash[home_or_away][:players].each do |index|
          if index[:points] > most_points
            most_points = index[:points]
            points_player = index[:player_name]
          end
        end
      end
    end
  end
  binding.pry
  points_player
end

def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  game_hash.each do |home_or_away, team_data|
    game_hash[home_or_away].each do |team_data, inner_values|
      if team_data == :players
        game_hash[home_or_away][:players].each do |index|
          if index[:shoe] > biggest_shoe
            biggest_shoe = index[:shoe]
            rebounds = index[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end
