create database visitors;

CREATE USER brooklyn WITH ENCRYPTED PASSWORD 'br00k11n';

GRANT CONNECT ON DATABASE visitors TO brooklyn;
GRANT ALL PRIVILEGES ON DATABASE visitors TO brooklyn;

\connect visitors

GRANT ALL PRIVILEGES ON SCHEMA public TO brooklyn;

CREATE TABLE public.MESSAGES (
                                 ID SERIAL PRIMARY KEY,
                                 NAME VARCHAR(30) NOT NULL,
                                 MESSAGE VARCHAR(400) NOT NULL
);

GRANT ALL PRIVILEGES ON  ALL TABLES IN SCHEMA  public TO brooklyn;
GRANT ALL PRIVILEGES ON  ALL SEQUENCES IN SCHEMA  public TO brooklyn;

INSERT INTO MESSAGES(NAME, MESSAGE) values ( 'Isaac Asimov', 'I was born in Brooklyn' );
INSERT INTO MESSAGES(NAME, MESSAGE) values ( 'Isaac Asimov', 'A robot may not injure a human being or, through inaction, allow a human being to come to harm.' );
INSERT INTO MESSAGES(NAME, MESSAGE) values ( 'Isaac Asimov', 'A robot must obey the orders given it by human beings except where such orders would conflict with the First Law.' );
INSERT INTO MESSAGES(NAME, MESSAGE) values ( 'Isaac Asimov', 'A robot must protect its own existence as long as such protection does not conflict with the First or Second Law.' );
