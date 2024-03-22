--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Ubuntu 14.10-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.10 (Ubuntu 14.10-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: lists; Type: TABLE; Schema: public; Owner: zanelee
--

CREATE TABLE public.lists (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.lists OWNER TO zanelee;

--
-- Name: list_id_seq; Type: SEQUENCE; Schema: public; Owner: zanelee
--

CREATE SEQUENCE public.list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.list_id_seq OWNER TO zanelee;

--
-- Name: list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zanelee
--

ALTER SEQUENCE public.list_id_seq OWNED BY public.lists.id;


--
-- Name: todos; Type: TABLE; Schema: public; Owner: zanelee
--

CREATE TABLE public.todos (
    id integer NOT NULL,
    name text NOT NULL,
    list_id integer NOT NULL,
    completed boolean DEFAULT false
);


ALTER TABLE public.todos OWNER TO zanelee;

--
-- Name: todo_id_seq; Type: SEQUENCE; Schema: public; Owner: zanelee
--

CREATE SEQUENCE public.todo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.todo_id_seq OWNER TO zanelee;

--
-- Name: todo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zanelee
--

ALTER SEQUENCE public.todo_id_seq OWNED BY public.todos.id;


--
-- Name: lists id; Type: DEFAULT; Schema: public; Owner: zanelee
--

ALTER TABLE ONLY public.lists ALTER COLUMN id SET DEFAULT nextval('public.list_id_seq'::regclass);


--
-- Name: todos id; Type: DEFAULT; Schema: public; Owner: zanelee
--

ALTER TABLE ONLY public.todos ALTER COLUMN id SET DEFAULT nextval('public.todo_id_seq'::regclass);


--
-- Name: lists list_name_key; Type: CONSTRAINT; Schema: public; Owner: zanelee
--

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT list_name_key UNIQUE (name);


--
-- Name: lists list_pkey; Type: CONSTRAINT; Schema: public; Owner: zanelee
--

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT list_pkey PRIMARY KEY (id);


--
-- Name: todos todo_pkey; Type: CONSTRAINT; Schema: public; Owner: zanelee
--

ALTER TABLE ONLY public.todos
    ADD CONSTRAINT todo_pkey PRIMARY KEY (id);


--
-- Name: todos todo_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zanelee
--

ALTER TABLE ONLY public.todos
    ADD CONSTRAINT todo_list_id_fkey FOREIGN KEY (list_id) REFERENCES public.lists(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

