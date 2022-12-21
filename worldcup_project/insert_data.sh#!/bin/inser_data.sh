#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

DELETE_TABLE1=$($PSQL "DROP TABLE IF EXISTS  teams, games;")

CREATE_TABLE_TEAMS=$($PSQL "CREATE TABLE teams(team_id SERIAL PRIMARY KEY, name varchar(50) UNIQUE NOT NULL);")

CREATE_TABLE_GAMES=$($PSQL "CREATE TABLE games(game_id SERIAL PRIMARY KEY, year INT NOT NULL, round VARCHAR(80) NOT NULL, winner_goals INT NOT NULL, opponent_goals INT NOT NULL, winner_id INT NOT NULL, opponent_id INT NOT NULL);")

TR=$($PSQL "TRUNCATE TABLE teams RESTART IDENTITY ;")
line_count=0;
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  WINNER=$($PSQL "SELECT name FROM teams WHERE name='$winner';")

  OPPONENT=$($PSQL "SELECT name FROM teams WHERE name='$opponent' ;")

  if [[ -z $WINNER && $winner != winner ]]
    then
    INSERTED_WINNER_TEAMS=$($PSQL "INSERT INTO teams(name) VALUES ('$winner');")
  fi

  if [[ -z $OPPONENT && $opponent != opponent ]]
    then
    INSERTED_OPPONENT_TEAMS=$($PSQL "INSERT INTO teams(name) VALUES ('$opponent');")
  fi

  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$winner';")

  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent' ;")

  if [[ $line_count != 0  ]]
    then
    INSERT_GAMES=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES ($year, '$round', $winner_goals, $opponent_goals, $WINNER_ID, $OPPONENT_ID);")
  fi

  ((line_count++))
done

ADD_WINNER_ID_FK=$($PSQL "ALTER TABLE games ADD FOREIGN KEY(winner_id) REFERENCES teams(team_id);")

ADD_OPPONENT_ID_FK=$($PSQL "ALTER TABLE games ADD FOREIGN KEY(opponent_id) REFERENCES teams(team_id);")
