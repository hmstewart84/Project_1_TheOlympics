DROP TABLE participations;
DROP TABLE events;
DROP TABLE athletes;
DROP TABLE nations;


CREATE TABLE nations (
  id serial4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE athletes (
  id serial4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  nation_id INT4 references nations(id) ON DELETE CASCADE
);

CREATE TABLE events (
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  sport VARCHAR(255),
  gold_id int4 references athletes(id) ON DELETE CASCADE,
  silver_id int4 references athletes(id) ON DELETE CASCADE,
  bronze_id int4 references athletes(id) ON DELETE CASCADE
);

CREATE TABLE participations (
  id serial4 PRIMARY KEY,
  event_id int4 references events(id) ON DELETE CASCADE,
  athlete_id int4 references athletes(id) ON DELETE CASCADE
);
