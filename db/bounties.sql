DROP TABLE bounties;

CREATE TABLE bounties (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  bounty_value INT,
  last_known_location VARCHAR(255)
);