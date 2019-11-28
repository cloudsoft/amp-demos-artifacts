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

INSERT INTO MESSAGES(NAME, MESSAGE) values ( 'Mom', 'I hope you took your vitamins' );
