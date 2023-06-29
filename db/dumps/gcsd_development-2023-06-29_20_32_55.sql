--
-- PostgreSQL database dump
--

-- Dumped from database version 13.8 (Ubuntu 13.8-1.pgdg18.04+1)
-- Dumped by pg_dump version 13.8 (Ubuntu 13.8-1.pgdg18.04+1)

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

ALTER TABLE ONLY public.sessions DROP CONSTRAINT fk_rails_c514f60c63;
ALTER TABLE ONLY public.active_storage_attachments DROP CONSTRAINT fk_rails_c3b3935057;
ALTER TABLE ONLY public.sessions DROP CONSTRAINT fk_rails_ad07c9070c;
ALTER TABLE ONLY public.active_storage_variant_records DROP CONSTRAINT fk_rails_993965df05;
ALTER TABLE ONLY public.time_slots DROP CONSTRAINT fk_rails_787640e17f;
ALTER TABLE ONLY public.sessions DROP CONSTRAINT fk_rails_31b34b204c;
DROP INDEX public.index_users_on_reset_password_token;
DROP INDEX public.index_users_on_email;
DROP INDEX public.index_time_slots_on_event_id_and_starting_at;
DROP INDEX public.index_time_slots_on_event_id;
DROP INDEX public.index_sessions_time_slots_on_time_slot_id;
DROP INDEX public.index_sessions_time_slots_on_session_id_and_time_slot_id;
DROP INDEX public.index_sessions_time_slots_on_session_id;
DROP INDEX public.index_sessions_on_time_slot_id;
DROP INDEX public.index_sessions_on_session_type_id;
DROP INDEX public.index_sessions_on_event_id;
DROP INDEX public.index_presenters_sessions_on_session_id;
DROP INDEX public.index_presenters_sessions_on_presenter_id;
DROP INDEX public.index_presenters_on_name;
DROP INDEX public.index_pages_on_slug;
DROP INDEX public.index_events_on_starting_at;
DROP INDEX public.index_events_on_slug;
DROP INDEX public.index_active_storage_variant_records_uniqueness;
DROP INDEX public.index_active_storage_blobs_on_key;
DROP INDEX public.index_active_storage_attachments_uniqueness;
DROP INDEX public.index_active_storage_attachments_on_blob_id;
DROP INDEX public.index_action_text_rich_texts_uniqueness;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.time_slots DROP CONSTRAINT time_slots_pkey;
ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
ALTER TABLE ONLY public.session_types DROP CONSTRAINT session_types_pkey;
ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
ALTER TABLE ONLY public.presenters DROP CONSTRAINT presenters_pkey;
ALTER TABLE ONLY public.pages DROP CONSTRAINT pages_pkey;
ALTER TABLE ONLY public.events DROP CONSTRAINT events_pkey;
ALTER TABLE ONLY public.active_storage_variant_records DROP CONSTRAINT active_storage_variant_records_pkey;
ALTER TABLE ONLY public.active_storage_blobs DROP CONSTRAINT active_storage_blobs_pkey;
ALTER TABLE ONLY public.active_storage_attachments DROP CONSTRAINT active_storage_attachments_pkey;
ALTER TABLE ONLY public.action_text_rich_texts DROP CONSTRAINT action_text_rich_texts_pkey;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.time_slots ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.sessions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.session_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.presenters ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.pages ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.events ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.active_storage_variant_records ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.active_storage_blobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.active_storage_attachments ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.action_text_rich_texts ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.time_slots_id_seq;
DROP TABLE public.time_slots;
DROP TABLE public.sessions_time_slots;
DROP SEQUENCE public.sessions_id_seq;
DROP TABLE public.sessions;
DROP SEQUENCE public.session_types_id_seq;
DROP TABLE public.session_types;
DROP TABLE public.schema_migrations;
DROP TABLE public.presenters_sessions;
DROP SEQUENCE public.presenters_id_seq;
DROP TABLE public.presenters;
DROP SEQUENCE public.pages_id_seq;
DROP TABLE public.pages;
DROP SEQUENCE public.events_id_seq;
DROP TABLE public.events;
DROP SEQUENCE public.active_storage_variant_records_id_seq;
DROP TABLE public.active_storage_variant_records;
DROP SEQUENCE public.active_storage_blobs_id_seq;
DROP TABLE public.active_storage_blobs;
DROP SEQUENCE public.active_storage_attachments_id_seq;
DROP TABLE public.active_storage_attachments;
DROP SEQUENCE public.action_text_rich_texts_id_seq;
DROP TABLE public.action_text_rich_texts;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: action_text_rich_texts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.action_text_rich_texts (
    id bigint NOT NULL,
    name character varying NOT NULL,
    body text,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    locale character varying DEFAULT 'en'::character varying NOT NULL
);


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.action_text_rich_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNED BY public.action_text_rich_texts.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.events (
    id bigint NOT NULL,
    starting_at timestamp(6) with time zone,
    is_featured boolean DEFAULT false,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    slug text NOT NULL,
    finishing_at timestamp(6) with time zone,
    status integer DEFAULT 0 NOT NULL,
    registration_url text
);


--
-- Name: TABLE events; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.events IS 'GCSD Events';


--
-- Name: COLUMN events.starting_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.events.starting_at IS 'Time event starts';


--
-- Name: COLUMN events.is_featured; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.events.is_featured IS 'Is this event featured on the home page?';


--
-- Name: COLUMN events.slug; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.events.slug IS 'a URL for registering with an external site like EventBrite';


--
-- Name: COLUMN events.finishing_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.events.finishing_at IS 'Time event finishes';


--
-- Name: COLUMN events.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.events.status IS 'draft, coming_soon, published or archived';


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages (
    id bigint NOT NULL,
    slug text NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: TABLE pages; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.pages IS 'Static pages';


--
-- Name: COLUMN pages.slug; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pages.slug IS 'unique, human readable name used in URL for page';


--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: presenters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.presenters (
    id bigint NOT NULL,
    name text NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: TABLE presenters; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.presenters IS 'People that present sessions at a GCSD event';


--
-- Name: COLUMN presenters.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.presenters.name IS 'Name of a presenter';


--
-- Name: presenters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.presenters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: presenters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.presenters_id_seq OWNED BY public.presenters.id;


--
-- Name: presenters_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.presenters_sessions (
    session_id bigint NOT NULL,
    presenter_id bigint NOT NULL
);


--
-- Name: TABLE presenters_sessions; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.presenters_sessions IS 'Join table of Presenters that present Sessions';


--
-- Name: COLUMN presenters_sessions.session_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.presenters_sessions.session_id IS 'Refers to a Session';


--
-- Name: COLUMN presenters_sessions.presenter_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.presenters_sessions.presenter_id IS 'Refers to a Presenter';


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: session_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.session_types (
    id bigint NOT NULL,
    order_by integer DEFAULT 10,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: TABLE session_types; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.session_types IS 'Lookup table of Session types';


--
-- Name: COLUMN session_types.order_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.session_types.order_by IS 'Orders these types in dropdowns';


--
-- Name: session_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.session_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: session_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.session_types_id_seq OWNED BY public.session_types.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id bigint NOT NULL,
    "limit" integer,
    event_id bigint NOT NULL,
    session_type_id bigint NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    time_slot_id bigint,
    presenter_bio_override text
);


--
-- Name: TABLE sessions; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.sessions IS 'Sessions that take place during an Event';


--
-- Name: COLUMN sessions."limit"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sessions."limit" IS 'Maximum number of attenders for the session. Nil implies no limit';


--
-- Name: COLUMN sessions.event_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sessions.event_id IS 'Refers to the Event this Session is part of';


--
-- Name: COLUMN sessions.session_type_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sessions.session_type_id IS 'Refers to this Session''s Session Type';


--
-- Name: COLUMN sessions.time_slot_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sessions.time_slot_id IS 'Refers to the Time Slot when this Session takes place';


--
-- Name: COLUMN sessions.presenter_bio_override; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sessions.presenter_bio_override IS 'Override the bio of the presenter(s) for the session if a) there is more than one presenter, or b) the session''s presenter needs a special bio';


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: sessions_time_slots; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions_time_slots (
    session_id bigint NOT NULL,
    time_slot_id bigint NOT NULL
);


--
-- Name: COLUMN sessions_time_slots.session_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sessions_time_slots.session_id IS 'A session';


--
-- Name: COLUMN sessions_time_slots.time_slot_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.sessions_time_slots.time_slot_id IS 'A time slot for the session';


--
-- Name: time_slots; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.time_slots (
    id bigint NOT NULL,
    event_id bigint NOT NULL,
    starting_at timestamp(6) with time zone NOT NULL,
    finishing_at timestamp(6) with time zone NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: TABLE time_slots; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.time_slots IS 'Time Slots within an Event';


--
-- Name: COLUMN time_slots.event_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.time_slots.event_id IS 'Refers to the Event this Session is part of';


--
-- Name: COLUMN time_slots.starting_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.time_slots.starting_at IS 'Time that the Time Slot starts';


--
-- Name: COLUMN time_slots.finishing_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.time_slots.finishing_at IS 'Time that the Time Slot finishes';


--
-- Name: time_slots_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.time_slots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: time_slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.time_slots_id_seq OWNED BY public.time_slots.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp(6) without time zone,
    last_sign_in_at timestamp(6) without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    first_name character varying,
    last_name character varying,
    role integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    time_zone character varying DEFAULT 'London'::character varying NOT NULL,
    locale character varying DEFAULT 'en'::character varying NOT NULL
);


--
-- Name: TABLE users; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.users IS 'Users in the GCSD system. Managed by Devise';


--
-- Name: COLUMN users.first_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.users.first_name IS 'First name of the User. Required if last_name null';


--
-- Name: COLUMN users.last_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.users.last_name IS 'Last name of the User. Required if first_name null';


--
-- Name: COLUMN users.role; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.users.role IS 'One of user, attender or admin';


--
-- Name: COLUMN users.time_zone; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.users.time_zone IS 'User''s preferred time zone';


--
-- Name: COLUMN users.locale; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.users.locale IS 'User''s preferred locale (i.e. language)';


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: action_text_rich_texts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_text_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.action_text_rich_texts_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: presenters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.presenters ALTER COLUMN id SET DEFAULT nextval('public.presenters_id_seq'::regclass);


--
-- Name: session_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session_types ALTER COLUMN id SET DEFAULT nextval('public.session_types_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: time_slots id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.time_slots ALTER COLUMN id SET DEFAULT nextval('public.time_slots_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: action_text_rich_texts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (266, 'title', 'Les 15 minutes pour composer un chant', 'Session', 21, '2023-06-21 22:00:33.636776', '2023-06-21 22:00:33.636776', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (267, 'description', '<div>Rome a été bâti en un jour mais le socle d''un chant peut-être écrit en quelques minutes. Rejoignez cet atelier pour avoir des conseils et astuces bon marché afin d''encourager la musique et l''inspiration lyrique pour composer un chant quand votre temps est limité ou bien lorsque vous écrivez dans un langage qui n''est pas votre langue maternelle. Découvrez comme il est facile de composer lorsque le ciel n''a pas de limites ! Il y aura également au cours de l''atelier un temps pour vous permettre d’écrire.</div>', 'Session', 21, '2023-06-21 22:00:33.640822', '2023-06-21 22:00:33.640822', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (268, 'requirements', '<div>Matériels requis :</div><ul><li>si vous êtes musicien : vos instruments</li><li>Papier, crayon et une gomme !</li><li>Votre bible viendra certainement compléter le tout.</li></ul>', 'Session', 21, '2023-06-21 22:00:33.649285', '2023-06-21 22:00:33.649285', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (269, 'presenter_bio_override', '', 'Session', 21, '2023-06-21 22:00:33.654981', '2023-06-21 22:00:33.654981', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (270, 'title', 'Collages de restauration', 'Session', 22, '2023-06-21 22:01:48.735566', '2023-06-21 22:01:48.735566', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (6, 'title', 'Ev', 'Page', 1, '2022-10-08 11:30:31.94852', '2022-10-08 11:30:31.94852', 'tr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (298, 'title', 'Pause 2', 'TimeSlot', 16, '2023-06-21 22:21:51.858643', '2023-06-21 22:21:51.858643', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (299, 'title', 'Pause 3', 'TimeSlot', 17, '2023-06-21 22:22:02.864835', '2023-06-21 22:22:02.864835', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (300, 'title', 'Art Meditation Courant 2 partage - anglais & français', 'Session', 26, '2023-06-21 22:24:45.925027', '2023-06-21 22:24:45.925027', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (301, 'description', '<div>Revenez et partagez ce que vous avez créé avec le reste du groupe</div>', 'Session', 26, '2023-06-21 22:24:45.927927', '2023-06-21 22:24:45.927927', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (13, 'body', '<div>Bu <em>hakkında</em> sayfası</div>', 'Page', 2, '2022-10-08 11:48:51.005181', '2022-11-03 22:16:03.043312', 'tr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (14, 'title', 'Hakkında', 'Page', 2, '2022-10-08 11:48:51.009331', '2022-11-03 22:16:03.051671', 'tr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (16, 'title', 'Home', 'Page', 1, '2022-11-04 17:22:18.413842', '2022-11-04 17:22:18.413842', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (15, 'title', 'About', 'Page', 2, '2022-11-04 17:21:11.536247', '2022-11-07 16:27:01.161302', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (189, 'description', '<div>L''atelier est inspiré du Kintsugi, l''artisanat japonais de réparation des céramiques cassées, où la cassure n''est pas cachée, mais où la réparation par un maître artisan, qui utilise de l''or dans les fissures, rend le récipient restauré plus précieux que l''original. Il existe de nombreuses corrélations entre la pratique du Kintsugi et la guérison par le Christ. Cette pratique a donc été utilisée avec des groupes pour promouvoir le bien-être spirituel et mental. Les participants à l''atelier peuvent s''inscrire en tant que "spectateur seulement".</div>', 'Session', 16, '2022-12-19 23:59:31.400583', '2022-12-19 23:59:31.400583', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (190, 'requirements', '<div>Toute personne souhaitant prendre part à la pratique aura besoin des éléments suivants:</div><ul><li>Une assiette, un bol ou un vase en céramique cassé ou ébréché.</li><li>Une colle à prise rapide (époxy 5 minutes)</li><li>De la poudre de mica doré</li><li>Quelques bâtons de cocktail ou équivalent pour mélanger la colle</li><li>Un pot en plastique recyclé (par exemple un pot de yaourt) ou des chutes de carton pour mélanger la colle.</li><li>Un morceau de papier brouillon pour protéger la table</li><li>De la colle bleue ou blanche</li><li>Des gants en vinyle si vous êtes sensible à la résine époxy.</li></ul>', 'Session', 16, '2022-12-19 23:59:31.407379', '2022-12-19 23:59:31.407379', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (3, 'description', '<div>Description of GCSD 2023</div>', 'Event', 2, '2022-09-17 21:16:27.1582', '2022-11-07 21:12:30.15598', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (93, 'description', '<div>This workshop is inspired by Kintsugi, the Japanese craft of repairing broken ceramics, where brokenness is not hidden, but repair by a master craftsperson, who uses gold in the cracks, makes the restored vessel more valuable than the original. There are many correlations between the practice of Kintsugi and healing through Christ, so the practice has been used with groups to promote spiritual and mental wellbeing.</div>', 'Session', 16, '2022-12-17 18:47:37.690483', '2023-06-19 22:49:24.063713', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (87, 'title', 'From Studio to Street', 'Session', 13, '2022-12-17 18:44:02.920635', '2022-12-17 18:44:02.920635', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (88, 'title', 'Workshops & Demos Session 2', 'TimeSlot', 8, '2022-12-17 18:45:14.748374', '2022-12-17 18:45:14.748374', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (90, 'title', 'Deep Pockets', 'Session', 14, '2022-12-17 18:46:10.165606', '2022-12-17 18:46:10.165606', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (91, 'description', '<div>In this workshop, we will be praying for specific people we know who need God''s restoring love while making customised origami hearts for them.</div>', 'Session', 15, '2022-12-17 18:46:56.088345', '2022-12-17 18:46:56.088345', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (92, 'title', 'Origami Hearts', 'Session', 15, '2022-12-17 18:46:56.093165', '2022-12-17 18:46:56.093165', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (94, 'title', 'Kintsugi', 'Session', 16, '2022-12-17 18:47:37.696388', '2022-12-17 18:47:37.696388', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (95, 'description', '<div>Have some fun with some acrylic ink painting techniques with tips given. Find out how similar it is to using watercolours but also different. A place to ask inky and watercolour questions!</div>', 'Session', 17, '2022-12-17 18:48:19.39027', '2022-12-17 18:48:19.39027', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (96, 'title', 'Playing with Acrylic Inks', 'Session', 17, '2022-12-17 18:48:19.393682', '2022-12-17 18:48:19.393682', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (97, 'title', 'Online Playback Theatre', 'TimeSlot', 9, '2022-12-17 18:49:21.239133', '2022-12-17 18:49:21.239133', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (99, 'title', 'Online Playback Theatre', 'Session', 18, '2022-12-17 18:52:00.79045', '2022-12-17 18:52:00.79045', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (100, 'title', 'Art Meditation Stream 2 Start', 'TimeSlot', 10, '2022-12-17 18:53:37.159549', '2022-12-17 18:53:37.159549', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (191, 'title', 'Coeurs en Origami', 'Session', 15, '2022-12-20 00:00:47.956782', '2022-12-20 00:00:47.956782', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (192, 'description', '<div>Dans cet atelier, nous allons prier pour des personnes spécifiques que nous connaissons qui ont besoin de l''amour restaurateur de Dieu tout en personnalisant des cœurs en origami pour eux.</div>', 'Session', 15, '2022-12-20 00:00:47.959908', '2022-12-20 00:00:47.959908', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (193, 'requirements', '<div>Vous aurez besoin de :</div><ul><li>2 pièces de papier spécial origami carrés de 15cm chacun (Ils peuvent être colorés ou à motifs avec une face vierge, d''une épaisseur maximale de 80 g/m²),</li><li>du matériel sec pour écrire (stylos, crayon de papier, marqueurs, crayons de couleurs, feutres).</li></ul>', 'Session', 15, '2022-12-20 00:00:47.966511', '2022-12-20 00:00:47.966511', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (194, 'bio', '<div>Anne est missionnaire à la WEC International missionary qui actuellement sert au travers de Arts Release de<br>Singapore. Elle utilise ses différents modules artistiques pour entrer plus en profondeur dans l''intercession et la prière incluant le Studio créatif d''Asie du Sud.</div>', 'Presenter', 13, '2022-12-20 00:02:03.173007', '2022-12-20 00:02:03.173007', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (204, 'requirements', '<ul><li>2 pcs of origami paper OR 2 squares of at least 15cm by 15cm (can be coloured or patterned paper with a blank side, no thicker than 80gsm)</li><li>Writing and dry drawing materials (eg pen, pencil, markers, colour pencils, crayons) i.e. not paints.</li></ul>', 'Session', 15, '2023-02-06 23:33:59.962386', '2023-02-06 23:33:59.962386', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (302, 'requirements', '', 'Session', 26, '2023-06-21 22:24:45.933977', '2023-06-21 22:24:45.933977', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (32, 'description', '<div>İlk <strong>KÜRESEL YARATICI STÜDYO GÜN</strong>ümüz için çok heyecanlıyız!<br><br>Tanrı hareket ediyor, hem profesyonel hem de eğlence amaçlı sanatçıları bağlantı, meditasyon, şifa, özgürlük ve nihayetinde O''nu övmek için güzellik yaratmaya çağırıyor.<br><br>Gün, dünyanın her yerinden bir araya gelen sanal ve fiziksel stüdyolarla hayatın her kesiminden bir Hıristiyan topluluğu tarafından barındırılıyor ve daha uzaklardan yaratıcıları ağırlıyor. İlk kez sanal kapıları dünyanın dört bir yanından insanlara açarken hep birlikte buluşacağız. Hıristiyan inancını keşfetmek için <strong>Restorasyon</strong> temasına odaklanırken, sizi yaratıcılığın birçok biçiminde kullanacağınız bir güne hoş geldiniz.<br><br>Kaydolduktan sonra, meditasyon, yaratıcı ve toplu ibadet, atölye çalışmaları ve sanatçı konuşmalarıyla dolu bir gün için Zoom ve Discord üzerinden bize katılmanın ayrıntılarını alacaksınız.</div>', 'Event', 1, '2022-11-07 21:11:26.574111', '2022-11-07 21:11:26.574111', 'tr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (181, 'title', 'Deep Pockets', 'Session', 14, '2022-12-19 23:55:30.990728', '2022-12-19 23:55:30.990728', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (303, 'presenter_bio_override', '', 'Session', 26, '2023-06-21 22:24:45.937789', '2023-06-21 22:24:45.937789', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (304, 'title', 'Echange avec Ewa Rossano', 'Session', 25, '2023-06-21 22:26:05.235101', '2023-06-21 22:26:05.235101', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (29, 'title', 'JMSC Avril 2022 : Restauration', 'Event', 1, '2022-11-07 17:58:09.533216', '2023-06-26 12:23:58.156721', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (34, 'description', '<div>xx</div>', 'Event', 2, '2022-11-07 21:12:03.201689', '2022-11-07 21:12:03.201689', 'tr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (30, 'description', '<div>xxx</div>', 'Event', 2, '2022-11-07 17:58:52.371144', '2022-11-07 17:58:52.371144', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (46, 'name', 'Plenary', 'SessionType', 5, '2022-12-07 16:35:03.602351', '2022-12-07 16:35:03.602351', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (182, 'description', '<div>La profondeur nous rappelle le bruits des cascades du psaume 42-7. C''est le moment de se mettre à l''abri en Dieu : utilisation de collages pour aller plus profondément en lui en apprenant à distinguer sa voix.</div>', 'Session', 14, '2022-12-19 23:55:30.994067', '2022-12-19 23:55:30.994067', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (28, 'description', '<div>Nous sommes tellement enthousiastes pour cette première <strong>JOURNÉE MONDIALE DU STUDIO CRÉATIF GLOBAL<br><br></strong>Dieu a agi, appelant des artistes sous des formes professionnelles et récréatives pour créer de la beauté pour la connexion, la méditation, la guérison, la liberté et, finalement, pour Lui apporter des louanges.<br><br>La journée est animée par une communauté de chrétiens de tous horizons avec des studios virtuels et physiques qui se réunissent dans le monde entier, accueillant des créatifs de plus loin. Pour la première fois, nous nous rencontrerons ensemble tout en ouvrant les portes virtuelles à d''autres dans le monde. Nous vous invitons donc à une journée d''utilisation de la créativité, sous ses nombreuses formes, alors que nous nous concentrons sur le thème de la <strong>Restauration</strong> pour explorer la foi chrétienne.<br><br>Après votre inscription, vous aurez ensuite les détails pour nous rejoindre sur Zoom et Discord pour une journée de méditation, de culte créatif et communautaire, d''ateliers et de discussions d''artistes.</div>', 'Event', 1, '2022-11-07 17:58:09.527145', '2022-11-07 18:01:31.72616', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (35, 'title', 'KYSG Ekim 2023', 'Event', 2, '2022-11-07 21:12:03.208413', '2022-11-07 21:12:03.208413', 'tr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (27, 'title', 'GCSD October 2023', 'Event', 2, '2022-11-07 17:53:55.184888', '2022-11-07 21:12:30.168379', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (31, 'title', 'JM du SC Octobre 2023', 'Event', 2, '2022-11-07 17:58:52.377158', '2022-11-07 21:13:07.015218', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (47, 'description', 'Come and be inspired by people using their art in a whole range of different ways', 'SessionType', 5, '2022-12-07 16:35:03.60534', '2022-12-07 16:35:03.60534', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (50, 'name', 'Workshops & Demos', 'SessionType', 6, '2022-12-07 16:35:53.882902', '2022-12-12 23:49:53.080763', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (178, 'title', 'Art & Méditation Courant 2 partage - anglais & français', 'TimeSlot', 13, '2022-12-19 23:49:09.109595', '2022-12-19 23:49:09.109595', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (48, 'name', 'Genel Kurul', 'SessionType', 5, '2022-12-07 16:35:15.079577', '2022-12-07 16:35:15.079577', 'tr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (49, 'description', 'Gelin ve sanatlarını çok çeşitli şekillerde kullanan insanlardan ilham alın', 'SessionType', 5, '2022-12-07 16:35:15.082956', '2022-12-07 16:35:15.082956', 'tr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (52, 'name', 'Atölyeler', 'SessionType', 6, '2022-12-07 16:36:31.868095', '2022-12-07 16:36:31.868095', 'tr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (53, 'description', 'Herkesin oynayabileceği uygulamalı atölye oturumları!', 'SessionType', 6, '2022-12-07 16:36:31.871137', '2022-12-07 16:36:31.871137', 'tr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (54, 'name', 'Atelier', 'SessionType', 6, '2022-12-07 16:37:10.903625', '2022-12-07 16:37:10.903625', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (55, 'description', 'Sessions d''ateliers pratiques où tout le monde peut jouer !', 'SessionType', 6, '2022-12-07 16:37:10.905216', '2022-12-07 16:37:10.905216', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (56, 'name', 'Séance Plénière', 'SessionType', 5, '2022-12-07 16:37:49.25007', '2022-12-07 16:37:49.25007', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (57, 'description', 'Venez vous inspirer de personnes utilisant leur art de différentes manières', 'SessionType', 5, '2022-12-07 16:37:49.253023', '2022-12-07 16:37:49.253023', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (62, 'name', 'booboo', 'SessionType', 7, '2022-12-10 17:08:26.12389', '2022-12-10 17:08:26.12389', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (51, 'description', 'Hands-on workshop sessions where everyone gets to learn some new skills', 'SessionType', 6, '2022-12-07 16:35:53.885417', '2022-12-12 23:49:53.083688', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (101, 'title', 'Workshops and Demos Session 4', 'TimeSlot', 11, '2022-12-17 20:27:31.78484', '2022-12-17 20:27:31.78484', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (102, 'title', 'Artist Talk - Ewa Rossano', 'TimeSlot', 12, '2022-12-17 20:28:04.582477', '2022-12-17 20:28:04.582477', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (103, 'title', 'Art Meditation Stream 2 Sharing', 'TimeSlot', 13, '2022-12-17 20:28:44.0075', '2022-12-17 20:28:44.0075', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (177, 'title', 'Les artistes partlent - Ewa Rossano', 'TimeSlot', 12, '2022-12-19 23:48:12.49643', '2022-12-19 23:50:38.107043', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (176, 'title', 'Ateliers et démos Session 4', 'TimeSlot', 11, '2022-12-19 23:47:52.516145', '2022-12-19 23:51:31.149992', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (179, 'title', 'Workshops & Demos Session 3', 'TimeSlot', 14, '2022-12-19 23:52:22.933176', '2022-12-19 23:52:22.933176', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (180, 'title', 'Ateliers et démos Session 3', 'TimeSlot', 14, '2022-12-19 23:52:41.29144', '2022-12-19 23:52:41.29144', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (183, 'requirements', '<div>Vous avez besoin de:</div><ul><li>Un mot, un verset, quelque chose qui a un sens spécial pour vous dans ces instants.</li><li>Un bâton de colle</li><li>Une feuille de papier A4</li><li>Une paire de ciseaux</li><li>Pièces à coller aléatoires venant de vieux magasines, photos etc.</li></ul>', 'Session', 14, '2022-12-19 23:55:31.001086', '2022-12-19 23:55:31.001086', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (185, 'title', 'S''amuser avec les Encres Acryliques', 'Session', 17, '2022-12-19 23:57:45.445733', '2022-12-19 23:57:45.445733', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (186, 'description', '<div>Amusez-vous à utiliser des techniques de peinture à l''encre acrylique en suivant les conseils donnés. Découvrez à quel point cette technique est similaire à l''aquarelle, mais aussi différente. Un endroit pour poser des questions sur l''encre et l''aquarelle !</div>', 'Session', 17, '2022-12-19 23:57:45.448703', '2022-12-19 23:57:45.448703', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (61, 'title', 'KYSG Ekim 2023: Gölgelerden', 'Event', 6, '2022-12-08 15:45:24.936736', '2023-02-01 22:48:14.525081', 'tr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (184, 'requirements', '<ul><li>A word, verse or concept that means something to you at this time</li><li>Glue stick</li><li>A4 paper</li><li>Scissors</li><li>Pieces of random collage - from old magazines, photos, etc.</li></ul>', 'Session', 14, '2022-12-19 23:56:07.806494', '2023-06-21 21:43:49.769922', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (33, 'title', 'Küresel Yaratıcı Stüdyo Günü Nisan 2022', 'Event', 1, '2022-11-07 21:11:26.582579', '2023-05-22 22:21:11.06925', 'tr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (2, 'description', '<div>We are so excited for our first <strong>GLOBAL CREATIVE STUDIO DAY!</strong><br><br>God has been moving, calling artists in both professional and recreational forms to create beauty for connection, meditation, healing, freedom, and ultimately to bring Him praise.<br><br>The  day is hosted by a community of Christians from all walks of life with virtual and physical studios that meet around the world, welcoming creatives from further afield. For the first time, we will meet altogether while opening the virtual doors to others around the world. So we welcome you to a day of using creativity, in its many forms, as we focus on the theme of <strong>Restoration</strong> to explore the Christian faith.<br><br>After registering, you will then details to join us over Zoom and Discord for a day of meditation, creative and communal worship, workshops, and artist talks.</div>', 'Event', 1, '2022-09-17 21:15:33.898083', '2022-12-12 22:17:15.013535', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (63, 'name', 'Art Meditation', 'SessionType', 8, '2022-12-12 23:27:11.386081', '2022-12-12 23:27:11.386081', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (64, 'description', 'After meditating on a scripture, take time to create a work, dance, song, or music in response. During the sharing session, we will come back together and share our works and insights in small groups.', 'SessionType', 8, '2022-12-12 23:27:11.387856', '2022-12-12 23:27:11.387856', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (65, 'description', '<div>Lindsey will be leading a meditation on Luke 15:11-32, the parable of the prodigal son. You will have time after the meditation to create a work, dance, song, or music in response to the story. During the sharing session, we will come back together and share our works and insights in small groups.</div>', 'Session', 6, '2022-12-12 23:27:57.35363', '2022-12-12 23:27:57.35363', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (66, 'title', 'Stream 1', 'Session', 6, '2022-12-12 23:27:57.35983', '2022-12-12 23:27:57.35983', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (67, 'description', '<div>Come back and share what you created with the rest of the group</div>', 'Session', 7, '2022-12-12 23:33:50.974913', '2022-12-12 23:33:50.974913', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (68, 'title', 'Stream 1 (sharing)', 'Session', 7, '2022-12-12 23:33:50.981522', '2022-12-12 23:33:50.981522', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (70, 'title', 'Introduction and Communal Art Worship', 'Session', 8, '2022-12-12 23:35:48.878808', '2022-12-12 23:35:48.878808', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (271, 'description', '<div>La communauté avec l''Esprit et les uns avec les autres, les bonnes relations et la fraternité apportent la guérison et la croissance. Dans cet atelier, nous peindrons plusieurs papiers de différentes couleurs et les déchirerons pour les reconstruire en un arbre d''apparence saine. L''idée est que nous sommes tous brisés, mais qu''au sein d''une communauté de guérison, nous pouvons devenir ensemble quelque chose de fort, de beau et de nourrissant.</div>', 'Session', 22, '2023-06-21 22:01:48.739444', '2023-06-21 22:01:48.739444', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (272, 'requirements', '<ul><li>Papiers</li><li>Aquarelles ou peintures pour affiches</li><li>Pinceaux</li><li>bâton de colle</li></ul>', 'Session', 22, '2023-06-21 22:01:48.747789', '2023-06-21 22:01:48.747789', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (72, 'title', 'Ephemeral Mandelas', 'Session', 9, '2022-12-12 23:59:09.532614', '2022-12-12 23:59:09.532614', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (73, 'description', '<div>In this dance workshop, you will learn a set dance routine to the song “Love Theory” by Kirk Franklin.<br><br>No previous experience is needed to join.</div>', 'Session', 10, '2022-12-12 23:59:47.238285', '2022-12-12 23:59:47.238285', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (74, 'title', 'Dance Choreography', 'Session', 10, '2022-12-12 23:59:47.243972', '2022-12-12 23:59:47.243972', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (76, 'title', 'Light Up with Batik', 'Session', 11, '2022-12-13 00:00:37.964643', '2022-12-13 00:00:37.964643', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (273, 'presenter_bio_override', '', 'Session', 22, '2023-06-21 22:01:48.752774', '2023-06-21 22:01:48.752774', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (78, 'title', 'Journaling and Healing', 'Session', 12, '2022-12-13 00:01:57.953713', '2022-12-13 00:01:57.953713', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (274, 'title', 'Raconter des histoires au henné', 'Session', 24, '2023-06-21 22:04:04.843744', '2023-06-21 22:04:04.843744', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (81, 'title', 'Art Meditation Stream 1 Start', 'TimeSlot', 1, '2022-12-17 18:37:13.419999', '2022-12-17 18:37:13.419999', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (275, 'description', '<div>C''est un plaisir quand votre joie de l''art peut se combiner avec celle de partager votre foi. Le henné attire naturellement les foules, que ce soit dans les maisons en briques de terre du Tchad ou dans les festivals de rue en Europe, comme l''a découvert Fiona. Elle partagera les bases et les astuces dans cet atelier de démonstration sur la façon d''appliquer le henné, comment de trouver des motifs et des ressources et de le combiner avec le partage d''histoires, de versets ou de témoignages. Si vous êtes assez courageux pour essayer de réaliser un dessin au henné, vous trouverez ci-dessous le matériel dont vous aurez besoin. Vous pouvez aussi vous contenter de regarder et de poser des questions ! Voici le site web que nous utiliserons pour l''atelier : <a href="https://www.hennastories.org/">https://www.hennastories.org/</a></div>', 'Session', 24, '2023-06-21 22:04:04.847341', '2023-06-21 22:04:04.847341', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (84, 'title', 'Workshops & Demos Session 1', 'TimeSlot', 4, '2022-12-17 18:42:38.313326', '2022-12-17 18:42:38.313326', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (85, 'title', 'Artist Talk - Chris Duffett', 'TimeSlot', 5, '2022-12-17 18:43:07.23109', '2022-12-17 18:43:07.23109', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (86, 'description', '<div>Chris will speak about pioneering creative ways of connecting the gospel with people around us.</div>', 'Session', 13, '2022-12-17 18:44:02.908857', '2022-12-17 18:44:02.908857', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (83, 'title', 'Introduction and Communal Art Worship', 'TimeSlot', 3, '2022-12-17 18:41:44.261184', '2023-02-04 23:47:40.127468', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (71, 'description', '<div>Participants are invited to take a ‘slow walk’ in nature prior to the workshop (garden, neighbourhood, park, beach, forest) and select objects that draw their attention (stones, seedpods, flowers, pinecones, petals, leaves, shells, feathers, etc.). These will be used to make their own mandala during the workshop.<br><br>N.B. Participants are encouraged to return the objects to their original environment afterward.</div>', 'Session', 9, '2022-12-12 23:59:09.527109', '2023-02-06 23:27:44.692724', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (75, 'description', '<div>Iris and Tesurgir will share a brief introduction into how they got into batik, where you will hear stories of how batik sessions have been used to build bridges and start conversations of faith with other cultures and non-believers. You will learn batik processes and colouring techniques. Workshop participants can join as ‘viewers only’.</div>', 'Session', 11, '2022-12-13 00:00:37.958742', '2023-02-06 23:29:05.508334', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (276, 'requirements', '<div>Matériel nécessaire (facultatif) :</div><ul><li>Cônes de henné frais* (henné 100% biologique), parfois appelés "cônes de henné mehndi".</li><li>Gants en latex ou en plastique</li><li>Serviettes en papier</li><li>Une personne qui accepte que vous lui fassiez du henné (vous pouvez le faire vous-même), ou une feuille de papier comme alternative.</li></ul><div><br>*Les cônes de henné achetés peuvent être congelés et décongelés 20 minutes avant leur utilisation pour les garder frais. Vous n''aurez besoin que d''un seul cône pour l''atelier !</div>', 'Session', 24, '2023-06-21 22:04:04.855731', '2023-06-21 22:04:04.855731', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (277, 'presenter_bio_override', '<div>Fiona Fung est une artiste visuelle autodidacte qui aime apprendre les arts des pays dans lesquels elle a vécu. Elle est membre d''ArtsRelease France et dirige le "Studio Créatif" depuis son domicile actuel en Normandie. Pour voir certaines de ses œuvres en général, consultez son Instagram.: <a href="https://instagram.com/fionafungart?utm_medium=copy_link">@fionafungart</a></div>', 'Session', 24, '2023-06-21 22:04:04.864138', '2023-06-21 22:04:04.864138', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (114, 'description', 'Après avoir médité sur une Écriture, prenez le temps de créer une œuvre, une danse, une chanson ou une musique en réponse. Au cours de la session de partage, nous reviendrons ensemble et partagerons nos travaux et nos idées en petits groupes.', 'SessionType', 8, '2022-12-18 00:39:26.506012', '2022-12-18 00:39:26.506012', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (116, 'description', '<div>Revenez et partagez ce que vous avez créé avec le reste du groupe</div>', 'Session', 7, '2022-12-18 00:40:49.428329', '2022-12-18 00:40:49.428329', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (279, 'description', '<div>Apprenez des techniques d''improvisation qui peuvent être utilisées pour danser pendant la louange ou en privé. Laissez le Saint-Esprit inspirer les mouvements en écoutant ses incitations.</div>', 'Session', 23, '2023-06-21 22:05:04.65389', '2023-06-21 22:05:04.65389', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (122, 'title', 'Théâtre de lecture en ligne', 'TimeSlot', 9, '2022-12-18 00:45:57.309682', '2022-12-18 00:45:57.309682', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (282, 'bio', '<div>Judith Woolley est partenaire de la WEC en Grande Bretagne, offrant un espace de grâce pour les missionnaires. En tant qu'' artiste, elle pratique de nombreux ateliers en groupe ou en individuel. Son travail en tant qu''artiste est l''expression de sa marche avec Dieu, utilisant son duo médiatique semi-abstrait. Sa passion est pour les espaces d''accueil, où des personnes peuvent trouver en Dieu le salut et la guérison.<br><br>Blog: <a href="http://judithwoolley.wordpress.com/">judithwoolley.wordpress.com</a><br>Instagram: <a href="https://instagram.com/judithwoolleyart?utm_medium=copy_link">@judithwoolleyart</a></div>', 'Presenter', 15, '2023-06-21 22:06:15.899802', '2023-06-21 22:06:15.899802', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (129, 'bio', '<div>Iris is from Singapore and is with the Arts Release Team SG. She loves creativity and is an Arts Advocate. Iris also loves batik and so what began as a hobby in 2020 has now sprung up into a ministry. Together with her batik teacher and friend Tesurgir, they want to bring this beautiful art form to many. They desire to use batik to befriend, bond, and build bridges to other cultures. So join this Batik appreciation workshop to hear stories of how COVID-19 opened the door for this ministry and for an experience of batik painting.<br><br>Instagram: @lightupwithbatik<br>Instagram: @Tesurgir</div>', 'Presenter', 4, '2022-12-19 22:59:26.159774', '2023-06-19 22:26:22.39962', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (278, 'title', 'Improvisation & danse a l''ecoute de Dieu', 'Session', 23, '2023-06-21 22:05:04.650728', '2023-06-21 22:08:47.990348', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (124, 'bio', '<div>Carolyn ‘Caz’ Campbell est leader spirituel, organisatrice de retraite et membre et partenaire de la WEC en Australie. Elle reçoit son inspiration avec un regard ludique et explorateur dans un esprit contemplatif avec un amour pour la nature. Habitant dans une magnifique ferme dans la vallée du Nambucca en Australie, son environnement de verts pâturages, de vues sur les montagnes, plages et forêts d''eucalyptus élevés sont avant de cadeaux offerts pour créer. Sa passion pour l''art éphémère a grandi dans un moment de transition où elle a ressenti le besoin de lâcher-prise tout en rejoignant son désir de participer à maintenir l''éco-système.<br><br>Son travail autour des mandalas ainsi que ses photographies peuvent être trouvé sur son Instagram @caz_creation ainsi que sur son profil Facebook au nom de Caroly Ann Campbell.</div>', 'Presenter', 2, '2022-12-19 22:54:10.790278', '2022-12-19 22:57:54.628829', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (128, 'bio', '<div>Iris est originaire de Singapour et fait partie de la Arts Release Team SG. Elle aime la créativité et soutient les arts. Iris aime aussi le batik et ce qui n''était au départ qu''un passe-temps en 2020 est devenu un ministère. Avec son professeur de batik et ami Tesurgir, ils veulent faire découvrir cette magnifique forme d''art à un grand nombre de personnes. Ils souhaitent utiliser le batik pour se lier d''amitié, créer des liens et créer des ponts avec d''autres cultures. Participez à cet atelier d''appréciation du batik pour entendre des histoires sur la façon dont COVID-19 a ouvert la porte à ce ministère et pour faire l''expérience de la peinture sur batik.<br><br>Instagram: @lightupwithbatik<br>Instagram: @Tesurgir</div>', 'Presenter', 4, '2022-12-19 22:58:59.187824', '2022-12-19 22:58:59.187824', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (119, 'title', 'Théâtre Playback ((Théâtre d’improv)', 'Session', 18, '2022-12-18 00:45:08.477102', '2023-06-21 22:10:50.46419', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (305, 'description', '<div>Ewa nous montrera et nous parlera de certaines de ses œuvres et techniques. Nous entendrons parler de sa foi et de son témoignage et il y a aura un temps de questions-réponses.</div>', 'Session', 25, '2023-06-21 22:26:05.238073', '2023-06-21 22:26:05.238073', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (306, 'requirements', '', 'Session', 25, '2023-06-21 22:26:05.244225', '2023-06-21 22:26:05.244225', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (188, 'title', 'Kintsugi', 'Session', 16, '2022-12-19 23:59:31.397314', '2022-12-19 23:59:31.397314', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (118, 'title', 'Art Meditation Courant 1 Partage - Anglais', 'TimeSlot', 2, '2022-12-18 00:41:16.851412', '2022-12-19 23:42:12.428106', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (115, 'title', 'Courant 1 (partage)', 'Session', 7, '2022-12-18 00:40:49.425077', '2022-12-19 23:44:15.856709', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (113, 'name', 'Art & Méditation', 'SessionType', 8, '2022-12-18 00:39:03.537838', '2022-12-19 23:44:46.194958', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (112, 'title', 'Art & Meditation Courant 1 Début', 'TimeSlot', 1, '2022-12-18 00:38:11.143266', '2022-12-19 23:45:45.326444', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (187, 'requirements', '<div>Pour ceux qui veulent s''amuser avec les encres pendant l''atelier, ils auront besoin :</div><ul><li>Des encres acryliques</li><li>Du papier et des pinceaux pour aquarelle</li><li>Des formes en papier prédécoupées, par exemple des cercles, ou des objets plats et fins de la nature, comme des feuilles.</li><li>Des accessoires facultatifs : Liquide de masquage, rouleau d''art, surfaces texturées, stylo à encre, crayon aquarelle bleu.</li></ul><div><br>Si vous n''avez pas d''encre et que vous ne souhaitez pas encore en acheter, apportez vos aquarelles ! Ou assistez simplement à la session en tant que démo.</div>', 'Session', 17, '2022-12-19 23:57:45.45572', '2022-12-19 23:57:45.45572', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (307, 'presenter_bio_override', '<div>Ewa Rossano a présenté ses œuvres lors de nombreuses expositions individuelles et collectives en Pologne et à l''étranger (notamment au Parlement européen à Bruxelles, au Conseil de l''Europe à Strasbourg, à l''Ossolineum de Wrocław, à l''UNESCO et à l''OCDE à Paris, au Musée de la ville à Reykjavik). Deux de ses monuments se trouvent à Wrocław : la Planète de cristal à l''entrée du quartier des Quatre Temples et l''Angelus Silesius dans le jardin de l''Ossolineum.<br><br>L''œuvre d''Ewa Rossano se caractérise par la combinaison de deux matériaux : le bronze et le verre. Ce dernier apparaît souvent dans ses œuvres sous la forme d''une pâte de verre colorée. L''utilisation intensive de la couleur et des taches de couleur prouvent les prédilections de l''artiste pour la peinture et fait que son art est perçu comme interdisciplinaire, faisant appel à diverses techniques et moyens d''expression artistique.<br><br><a href="https://www.ewarossano.com">www.ewarossano.com</a></div>', 'Session', 25, '2023-06-21 22:26:05.248644', '2023-06-21 22:26:05.248644', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (127, 'bio', '<div>AK est suédoise et a habité en Grande Bretagne pendant 25 ans. Elle est passionnée par le théâtre et la danse et possède de nombreuses années d''expériences pendant lesquelles elle a enseigné dans ces deux catégories. Elle participe également à l''ASHA Arts performance - un ministère parmi les femmes sud-asiatiques de différentes confessions de foi.</div>', 'Presenter', 3, '2022-12-19 22:57:07.882251', '2023-06-21 21:55:25.268501', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (69, 'description', '<div>Find out what the GCSD is all about, and then join us for a compilation of worship songs and music.<br><br>Participants are encouraged to create as they listen to the worship sets. Feel free to play an instrument, dance, sing, paint, draw, sculpt, write or create anything else as a form of worship.</div>', 'Session', 8, '2022-12-12 23:35:48.872861', '2023-06-28 14:51:22.093948', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (133, 'bio', '<div>Lin Wei is quiet, comfortable with tears, and loves to listen. She enjoys retreats, spiritual formation, and pondering over words. She studied design in school. She can be found reading children''s picture books in Singapore libraries, grateful for how stories and illustrations come together in these books. Art is an expression of what is inside her. She writes notes and doodles while she writes. As a form of therapy, journaling helps her share her heart, and through writing or drawing out her inner heart, she remembers God in her story as she becomes attentive to herself and God.<br><br>(Word &amp; Art) has shaped her art – God’s Word ( ) inspiring her art ( ); and words in her heart expressed as art.<br><br>Instagram: @comehome.wei</div>', 'Presenter', 5, '2022-12-19 23:09:33.38242', '2022-12-19 23:09:33.38242', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (134, 'bio', '<div>Liz is a multidisciplinary artist with both studio and socially engaged practices. She is a partner with WEC Arts Release, on the leadership team of the Vine Church in Suffolk, UK, and one of the coordinators of the Friday Night Art Club.<br><br><a href="https://www.lizwaughmcmanus.co.uk">www.lizwaughmcmanus.co.uk</a></div>', 'Presenter', 6, '2022-12-19 23:10:56.638189', '2022-12-19 23:10:56.638189', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (135, 'bio', '<div>Fiona, a British French binational, is a member of Arts Release and runs the French Creative Studio from her current home in Normandy. A self-taught painter who is currently using acrylic inks to express the restorative beauty she sees in nature.<br><br>To see some of her work in general check out her Instagram: @fionafungart</div>', 'Presenter', 7, '2022-12-19 23:11:41.425408', '2022-12-19 23:11:41.425408', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (136, 'bio', '<div>Fiona, une binationale franco-britannique, est membre d''ArtsRelease et dirige le Studio Créatif français depuis sa maison en Normandie. Une peintre autodidacte qui utilise actuellement des encres acryliques pour exprimer la beauté restorative qu''elle voit dans la nature.<br><br>Pour voir certaines de ses œuvres en général, consultez son Instagram.: @fionafungart</div>', 'Presenter', 7, '2022-12-19 23:12:44.091622', '2022-12-19 23:12:44.091622', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (137, 'bio', '<div>Lin Wei est calme, à l''aise avec les larmes et aime écouter. Elle aime les retraites, la formation spirituelle et la réflexion sur les mots. Elle a étudié le design à l''école. On peut la trouver en train de lire des livres d''images pour enfants dans les bibliothèques de Singapour, reconnaissante de la façon dont les histoires et les illustrations se rejoignent dans ces livres. L''art est l''expression de ce qui est en elle. Elle prend des notes et griffonne tout en écrivant. En tant que forme de thérapie, la tenue d''un journal l''aide à partager son cœur, et en écrivant ou en dessinant son cœur intérieur, elle se souvient de Dieu dans son histoire en devenant attentive à elle-même et à Dieu.<br><br>(Word &amp; Art) a façonné son art - la Parole de Dieu ( ) inspirant son art ( ) ; et les mots dans son cœur exprimés en tant qu''art.<br><br>Instagram: @comehome.wei</div>', 'Presenter', 5, '2022-12-19 23:13:35.558677', '2022-12-19 23:13:35.558677', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (138, 'bio', '<div>Liz est une artiste pluridisciplinaire dont les pratiques relèvent à la fois du studio et de l''engagement social. Elle est partenaire du WEC Arts Release, fait partie de l''équipe de direction de la Vine Church à Suffolk, au Royaume-Uni, et est l''une des coordinatrices du Friday Night Art Club.<br><br><a href="https://www.lizwaughmcmanus.co.uk">www.lizwaughmcmanus.co.uk</a></div>', 'Presenter', 6, '2022-12-19 23:14:18.273798', '2022-12-19 23:14:18.273798', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (139, 'title', 'Journal du Bord & Guerison', 'Session', 12, '2022-12-19 23:18:18.967758', '2022-12-19 23:18:18.967758', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (140, 'description', '<div>L''histoire de la femme qui a fait une belle chose pour Jésus, en versant un onguent coûteux pour le préparer à l''enterrement. Cette femme voit, elle comprend que Jésus va mourir avant de monter sur la croix. Jésus la voit. Dans son amour, il lui permet de verser l''onguent sur la tête de Jésus, la protège par des paroles au milieu des disciples qui ont vu et se sont indignés. Dans cette histoire, on voit beaucoup de choses de la part de Jésus, de la femme et des disciples. Qu''en est-il de votre propre histoire ? Avez-vous besoin de réécrire une histoire remodelée par son regard?<br><br>La Journée mondiale de la créativité a lieu une semaine avant le Vendredi saint, le Samedi saint et le Dimanche de la résurrection. Venez comme vous êtes, écoutez cette histoire tirée de Matthieu 26, 8-13 qui vous est lue lentement. Avec une réflexion guidée, qu''elle vous inspire à écrire/dessiner/journaliser votre propre histoire. Nous venons tous de différentes parties du monde et nous nous approchons de Dieu par le biais de cette histoire : "partout où cet Évangile sera proclamé dans le monde entier, ce que [cette femme] a fait sera aussi raconté en mémoire d''elle". Pendant que vous tenez votre journal, en souvenir de votre histoire, il y aura un don de silence et de solitude. C''est un espace pour laisser Dieu élever une prière en vous. En ralentissant, Il peut attirer votre attention sur quelque chose qui a été enterré, et vous permet de voir.<br><br><strong>Nombre de places limité pour l''atelier</strong></div>', 'Session', 12, '2022-12-19 23:18:18.971005', '2022-12-19 23:18:18.971005', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (141, 'requirements', '<div>Matériel nécessaire:</div><ul><li>Du papier et du matériel d''écriture pour écrire, dessiner ou tenir un journal.</li><li>Peut-être un espace calme où vous êtes</li></ul>', 'Session', 12, '2022-12-19 23:18:18.978007', '2022-12-19 23:18:18.978007', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (142, 'title', 'Ateliers et démos Session 1', 'TimeSlot', 4, '2022-12-19 23:19:36.585983', '2022-12-19 23:19:36.585983', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (143, 'title', 'Ateliers et démos Session 2', 'TimeSlot', 8, '2022-12-19 23:19:56.994115', '2022-12-19 23:19:56.994115', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (144, 'title', 'Mandalas Ephémères', 'Session', 9, '2022-12-19 23:21:47.517269', '2022-12-19 23:21:47.517269', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (145, 'description', '<div>Les participants sont invités à se promener tranquillement dans la nature pour l''atelier (jardin, voisinage, parc, plage, forêt) et à trouver des objets qui ont retenu leur attention (pierres, graines, fleurs, pommes de pin , pétales, feuilles, coquillages, plumes, etc.). Ils seront utilisés pour créer votre propre mandala pendant l''atelier.<br><br><em>P.S. Les participants sont encouragés à remettre les objets dans les lieux où ils les ont trouvés.</em></div>', 'Session', 9, '2022-12-19 23:21:47.518968', '2022-12-19 23:21:47.518968', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (146, 'requirements', '<div>Un appareil photo serait utile pour photographier et partager votre Mandala dans un court moment de pause au sein du groupe.</div>', 'Session', 9, '2022-12-19 23:21:47.522485', '2022-12-19 23:21:47.522485', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (147, 'title', 'Choreographie & Danse', 'Session', 10, '2022-12-19 23:26:49.471635', '2022-12-19 23:26:49.471635', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (148, 'description', '<div>Dans cet atelier, vous apprendrez une danse autour du chant “Love Theory” de Kirk Franklin.<br><br>Il n''est pas nécessaire d''avoir de l''expérience pour participer à cet atelier.</div>', 'Session', 10, '2022-12-19 23:26:49.474525', '2022-12-19 23:26:49.474525', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (150, 'title', 'S''eclairer avec le Batik', 'Session', 11, '2022-12-19 23:29:28.385786', '2022-12-19 23:29:28.385786', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (151, 'description', '<div>Iris et Tesurgir partageront une brève introduction sur la façon dont elles se sont lancées dans le batik. Vous entendrez des histoires sur la façon dont les sessions de batik ont été utilisées pour construire des ponts et commencer des conversations de foi avec d''autres cultures et des non-croyants. Vous apprendrez les procédés et les techniques de coloration du batik. Les participants à l''atelier peuvent s''inscrire en tant que "spectateur seulement".</div>', 'Session', 11, '2022-12-19 23:29:28.387415', '2022-12-19 23:29:28.387415', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (309, 'title', 'Finance', 'Page', 6, '2023-06-25 20:34:02.042234', '2023-06-25 20:34:02.042234', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (152, 'requirements', '<div>Toute personne souhaitant participer de manière pratique aura besoin des éléments suivants un kit de batik<br><br>Ceux qui se trouvent à Singapour peuvent commander auprès d''Iris via Instagram @lightupwithbatik ou au<br>92219051. Ceux qui ne sont pas à Singapour peuvent soit commander par l''intermédiaire de Tesurgir Instagram @Tesurgir, soit trouver leurs propres kits de batik dans leur pays d''origine. Veuillez tenir compte des coûts et des délais de livraison. Si vous souhaitez commander auprès d''Iris ou de Tesurgir, vous devrez confirmer vos commandes avant le 20 mars 2022. Leur coût est de 30 SGD par kit/pack (comprend un kit de batik personnalisé dessiné à la main, un pinceau et des peintures, ainsi que la livraison dans le pays).</div>', 'Session', 11, '2022-12-19 23:29:28.391188', '2022-12-19 23:29:28.391188', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (153, 'title', 'Introduction aux studios créatifs et Arts & Louange', 'Session', 8, '2022-12-19 23:31:57.81559', '2022-12-19 23:31:57.81559', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (283, 'bio', '<div>Birte est théologienne du théâtre, missionnaire du WEC et membre d''ArtsRelease. Elle inspire la foi par le théâtre afin que la Bible soit mieux comprise, que Dieu soit aimé plus profondément et que la foi soit vécue dans la vie quotidienne. Son désir est de transmettre ses connaissances et sa passion pour Dieu et le théâtre en formant d''autres personnes. Outre la lecture, elle donne des cours d''oralité et fait partie du personnel de l''école biblique Cornerstone aux Pays-Bas.<br><br>Consultez son site Web pour plus de détails : <a href="https://www.theater-anstoss-zum-glauben.de/">https://www.theater-anstoss-zum-glauben.de/</a></div>', 'Presenter', 16, '2023-06-21 22:07:17.814855', '2023-06-21 22:07:17.814855', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (284, 'bio', '<div>Je m''appelle Emilia. Avec mon mari, Young Tae, j''enseigne la céramique dans notre studio en Roumanie depuis 2013. J''ai étudié l''art de la céramique, la peinture et la théologie en Roumanie et en Corée du Sud. Nous dirigeons également une réunion zoom tous les samedis matin, un studio créatif chrétien (Art Release inspiré).<br><br><a href="https://facebook.com/bufnitaceramica">facebook.com/bufnitaceramica</a><br><a href="https://Emchangstudio.com">Emchangstudio.com</a></div>', 'Presenter', 17, '2023-06-21 22:08:26.670162', '2023-06-21 22:08:26.670162', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (156, 'bio', '<div>Cath et Angus MacGregor sont des leaders de louange et des auteurs de chansons. Leur cœur est de poursuivre et d''apprécier l''intimité et la rencontre avec Dieu, et de collaborer avec lui pour établir son royaume sur terre, comme au ciel. Leur dernière aventure, The Dwelling Place Trail, les emmène à travers le Royaume-Uni dans les maisons des gens pour adorer, guerroyer et s''imprégner de la présence de Dieu, en quête de guérison, de liberté et de percée pour tous. Ils vivent à Sowerby Bridge avec leur chat Moses.  <a href="https://www.cathandangusmusic.com/">https://www.cathandangusmusic.com/</a> and Facebook</div>', 'Presenter', 8, '2022-12-19 23:33:15.419414', '2022-12-19 23:33:15.419414', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (157, 'bio', '<div>Cath and Angus MacGregor are worship leaders and songwriters. Their heart is to pursue, enjoy intimacy and<br>encounter with God, and to co-labour with Him to establish His Kingdom on earth, as it is in Heaven. Their latest adventure, The Dwelling Place Trail, takes them across the UK into people’s homes to worship, warfare, and soak in God’s presence, pursuing healing, freedom, and breakthrough for all. They live in Sowerby Bridge with their cat Moses. <a href="https://www.cathandangusmusic.com/">https://www.cathandangusmusic.com/</a> and Facebook</div>', 'Presenter', 8, '2022-12-19 23:34:19.754975', '2022-12-19 23:34:19.754975', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (159, 'bio', '<div>Joe et Jemma Aiken dirigent la louange ensemble depuis 16 ans en tant qu''équipe mari et femme. Leur dernier EP ''Building Your Kingdom'' a été diffusé sur la radio chrétienne UCB2 au Royaume-Uni, et six chansons des trois dernières versions ont été ajoutées à la liste de lecture de la radio UCB2. Ils sont des leaders de louange réguliers dans leur église locale, The Vine Church, Suffolk, UK et font également partie de l''équipe de direction de l''église en tant que trésorier et secrétaire. Cherchez "Joe Aiken Music" sur Facebook, Instagram et Spotify.</div>', 'Presenter', 9, '2022-12-19 23:35:33.551903', '2022-12-19 23:35:33.551903', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (160, 'bio', '<div>Joe and Jemma Aiken have been leading worship together for 16 years as a husband and wife team. Their latest EP ‘Building Your Kingdom’ has featured on UCB2 Christian radio in the UK with six songs from the last three releases being added to the UCB2 radio playlist. They are regular worship leaders at their local church, The Vine Church, Suffolk, UK, and also part of the church leadership team as treasurer and secretary. Search ‘Joe Aiken Music’ for Facebook, Instagram, and Spotify.</div>', 'Presenter', 9, '2022-12-19 23:36:05.544403', '2022-12-19 23:36:05.544403', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (161, 'bio', '<div>Job Tan cultivated a conscious and close relationship with the Lord Jesus from his youth, his faith journey has taken him to extreme ends of highs n lows. His training in music is wide and deep, playing &amp; tuning the piano, playing a few instruments, composing, improvising, writing, and teaching. He is married with 3 children. You can find Job Tan''s music on YouTube here</div>', 'Presenter', 10, '2022-12-19 23:36:37.700753', '2022-12-19 23:36:37.700753', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (162, 'bio', '<div>Job Tan a cultivé une relation consciente et étroite avec le Seigneur Jésus depuis son plus jeune âge, son voyage dans la foi l''a conduit à des hauts et de bas extrêmes. Sa formation musicale est vaste et profonde : il joue et accorde le piano, joue de quelques instruments, compose, improvise, écrit et enseigne. Il est marié et a trois enfants. Vous pouvez trouver la musique de Job Tan sur YouTube ici</div>', 'Presenter', 10, '2022-12-19 23:37:01.131542', '2022-12-19 23:37:01.131542', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (311, 'title', 'A notre sujet', 'Page', 2, '2023-06-25 20:35:35.437731', '2023-06-25 20:35:35.437731', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (164, 'bio', '', 'Presenter', 12, '2022-12-19 23:38:25.418038', '2022-12-19 23:38:25.418038', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (166, 'title', 'Stream 2', 'Session', 20, '2022-12-19 23:40:27.322325', '2022-12-19 23:40:27.322325', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (167, 'description', '<div>Dave will be sharing on Revelation 21: 1-5a. You will have time after the meditation to create a work, dance, song, or music in response to this passage of scripture. During the sharing session, we will come back together and share our works and insights in small groups</div>', 'Session', 20, '2022-12-19 23:40:27.325397', '2022-12-19 23:40:27.325397', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (169, 'title', 'Courant 2', 'Session', 20, '2022-12-19 23:41:05.763405', '2022-12-19 23:41:05.763405', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (170, 'description', '<div>Dave partagera sur Apocalypse 21:1-5a. Après la méditation, vous aurez le temps de créer une œuvre, une danse, un chant ou une musique en réponse à ce passage des Écritures. Pendant la session de partage, nous reviendrons ensemble et partagerons nos œuvres et nos idées en petits groupes.</div>', 'Session', 20, '2022-12-19 23:41:05.765536', '2022-12-19 23:41:05.765536', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (171, 'requirements', '', 'Session', 20, '2022-12-19 23:41:05.769163', '2022-12-19 23:41:05.769163', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (82, 'title', 'Art Meditation Stream 1 Sharing - English', 'TimeSlot', 2, '2022-12-17 18:41:05.100888', '2022-12-19 23:42:24.854523', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (172, 'requirements', '', 'Session', 7, '2022-12-19 23:44:15.861318', '2022-12-19 23:44:15.861318', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (173, 'title', 'Introduction aux studios créatifs et Arts & Louange', 'TimeSlot', 3, '2022-12-19 23:46:17.335008', '2022-12-19 23:46:17.335008', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (174, 'title', 'Les artistes parlent - Chris Duffett', 'TimeSlot', 5, '2022-12-19 23:46:43.544006', '2022-12-19 23:46:43.544006', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (175, 'title', 'Art & Méditation Courant 2 - anglais & français', 'TimeSlot', 10, '2022-12-19 23:47:25.872135', '2022-12-19 23:47:25.872135', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (5, 'body', '<div>Tanrı hareket ediyor, sanatçıları hem profesyonel hem de eğlence amaçlı formlarda bağlantı, meditasyon, şifa, özgürlük ve nihayetinde O''na övgü getirmek için güzellik yaratmaya çağırıyor.<br><br>Küresel Yaratıcı Stüdyo Günleri, Avustralya, Fransa, Yeni Zelanda, Singapur, Romanya ve Birleşik Krallık''ta bir araya gelen sanal ve fiziksel stüdyolarla hayatın her kesiminden bir Hristiyan topluluğu tarafından ev sahipliği yapıyor ve daha uzak yerlerden gelen yaratıcıları ağırlıyor. Yaratıcılığı birçok biçimde kullanacağınız günlere hoş geldiniz.</div>', 'Page', 1, '2022-10-08 11:30:31.939171', '2023-02-01 22:40:55.841472', 'tr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (195, 'body', '<div>Dieu a agi en appelant des artistes dans le milieu professionnel comme dans le milieu des loisirs afin de créer une belle harmonie de connexion, de méditation, de guérison, essentiellement pour le louer. Le studio créatif global est né au sein d’une communauté chrétienne de tous horizons au travers de rendez-vous virtuels ou physique en Australie, en France, en Nouvelle Zélande, à Singapour, ainsi qu’en Roumanie et au Royaume Unis.<br><br>Nous allons pour la première fois nous rencontrer autour de ces « portes ouvertes » virtuelles autour du monde entier. Nous vous souhaitons la bienvenue pour ce jour de créativité sous de nombreuses formes restées fixées sur le thème de la restauration dans l’exploration de la foi chrétienne.</div>', 'Page', 1, '2023-02-01 22:42:35.940986', '2023-02-01 22:42:35.940986', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (196, 'title', 'Page d''accueil', 'Page', 1, '2023-02-01 22:42:35.947892', '2023-02-01 22:42:35.947892', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (59, 'title', 'GCSD October 2023: From The Shadow', 'Event', 6, '2022-12-08 15:44:26.611312', '2023-02-01 22:45:09.46976', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (60, 'description', '<div>Sit amet purus gravida quis blandit turpis cursus. Leo integer malesuada nunc vel. Mus mauris vitae ultricies leo integer malesuada. Pellentesque habitant morbi tristique senectus et netus. Scelerisque felis imperdiet proin fermentum leo. Turpis egestas pretium aenean pharetra.<br>Aliquam nulla facilisi cras fermentum. Pellentesque adipiscing commodo elit at imperdiet dui accumsan sit. Rutrum quisque non tellus orci ac auctor augue mauris augue.</div>', 'Event', 6, '2022-12-08 15:45:24.931131', '2023-02-01 22:47:43.977569', 'tr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (198, 'title', 'JMSC Octobre 2023 : De l''ombre', 'Event', 6, '2023-02-01 22:47:12.518492', '2023-02-01 22:48:43.270043', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (199, 'bio', '<div>Chris Duffett is an evangelist and artist with a desire to bring words, comfort, and scenes from God''s heart to those he paints for. A former president of the Baptist Union of Great Britain and founder of the Light College and Collective, he has a wealth of experience in Theology, Chaplaincy, Culture, and the Arts. An author of four books, his latest is a novel on the life of his hero, Philip the evangelist.<br><br><a href="https://www.chrisduffettart.com">www.chrisduffettart.com</a><br><a href="https://lightcollege.ac.uk/">lightcollege.ac.uk</a></div>', 'Presenter', 14, '2023-02-06 22:09:46.907428', '2023-02-06 22:12:56.120364', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (77, 'description', '<div>A story of the woman who has done a beautiful thing for Jesus, pouring expensive ointment to prepare Him for burial. This woman sees, she understands Jesus is going to die before He went to the cross. Jesus sees her. In His love, He allowed her to pour the ointment on His head, protected her with words in the midst of disciples who saw and were indignant. In this story, there is much seen from Jesus, the woman, and the disciples. What about your own story? Do you need a re-write a story re-shaped by His seeing?<br><br>Global Creative Day is a week before Good Friday, Holy Saturday, and Resurrection Sunday. Come as you are, listen to this story from Matthew 26:8-13 read to you slowly. With guided reflection, may it inspire you to write/draw/journal your own story? We are all from different parts of the world, coming to God through this story, “wherever this gospel is proclaimed in the whole world, what [this woman] has done will also be told in memory of her.” While you journal, in memories of your story, there will be a gift of silence and solitude. It is a space to let God lift a prayer within you. As you slow down, He may bring your attention to something that has been buried, and lets you see.</div>', 'Session', 12, '2022-12-13 00:01:57.947906', '2023-02-06 23:15:30.349401', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (201, 'requirements', '<ul><li>Paper and writing materials for you to write/draw/journal</li><li>Perhaps a quiet space where you are</li></ul>', 'Session', 12, '2023-02-06 23:15:30.364432', '2023-02-06 23:15:30.364432', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (313, 'title', 'Histoire', 'Page', 5, '2023-06-25 20:36:36.30889', '2023-06-26 12:17:52.833971', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (202, 'requirements', '<div>A camera may be needed for photographing and sharing your Mandala in a small break out group (optional).</div>', 'Session', 9, '2023-02-06 23:27:44.706071', '2023-02-06 23:27:44.706071', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (125, 'bio', '<div>Carolyn ‘Caz’ Campbell is a spiritual director, retreat curator, and member-care partner of WEC Australia. A creative contemplative with a deep love of nature, she receives inspiration and insight for fruitful living through playful, embodied exploration. Living on her eco-farm in the beautiful Nambucca Valley of NSW, Australia, the rolling green pastures, mountain vistas, beaches, and tall-gum forests offer gifts for co-creating. Her passion for ephemeral art grew out of the invitation to ‘let go’ while processing a major life transition and her desire to maintain ecosystems.<br><br>Her mandalas, artwork, and photography can be found on Instagram as @caz_creation</div>', 'Presenter', 2, '2022-12-19 22:54:34.207494', '2023-02-06 23:32:34.223231', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (203, 'requirements', '<div>Anyone wishing to take part practically will need a Batik kit.<br><br>Those in Singapore can order through Iris via Instagram <strong>@lightupwithbatik</strong> or on 92219051. Those living<br>outside of Singapore can either order through Tesurgir Instagram <strong>@Tesurgir</strong> or find their own batik kits in their<br>home country. Please consider delivery costs and timings. If you want to order from Iris or Tesurgir you will need to confirm orders by 20 March 2022. Their cost is SGD $30 per kit/pack (includes one customised hand-drawn batik kit design, brush, and paints and delivery in SG).</div>', 'Session', 11, '2023-02-06 23:29:05.521725', '2023-06-21 21:46:27.343091', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (126, 'bio', '<div>A.K. is from Sweden and has lived in the UK for 25 years. She has a passion for drama and dance and has many years of experience teaching workshops in both these art forms. She was also part of ASHA performing Arts - ministering to South Asian women of different faiths.</div>', 'Presenter', 3, '2022-12-19 22:55:59.542838', '2023-06-21 21:45:06.789361', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (317, 'requirements', '', 'Session', 8, '2023-06-28 14:51:22.105872', '2023-06-28 14:51:22.105872', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (205, 'bio', '<div>Anne is a WEC International missionary currently serving with Arts Release Singapore. She has been facilitating prayer and intercession using various art forms, including for the Creative Studio Asia.</div>', 'Presenter', 13, '2023-02-06 23:34:44.490238', '2023-02-06 23:34:44.490238', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (206, 'bio', '<div>Judith Woolley is with WEC UK, offering a place of Space and Grace to mission workers. As an artist, she runs art exercises and workshops for individuals and groups. Her artwork is an expression of how she walks with God, using semi- abstract mixed media. Her passion is to host spaces, where people can find God''s salvation and healing.<br><br>Blog: <a href="https://judithwoolley.wordpress.com">judithwoolley.wordpress.com</a><br>Instagram: @judithwoolleyart</div>', 'Presenter', 15, '2023-02-06 23:37:12.008772', '2023-02-06 23:37:12.008772', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (216, 'title', 'Break 1', 'TimeSlot', 15, '2023-06-14 21:56:37.97901', '2023-06-21 22:20:12.04411', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (217, 'title', 'Pause 1', 'TimeSlot', 15, '2023-06-14 22:09:30.889182', '2023-06-21 22:21:32.287895', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (1, 'body', '<div>God has been moving, calling artists in both professional and recreational forms to create beauty for connection, meditation, healing, freedom, and ultimately to bring Him praise.<br><br>Global Creative Studio Days are hosted by <a href="https://artsrelease.org/">Arts Release</a> and a community of Christians from all walks of life with virtual and physical studios that meet in Australia, France, New Zealand, Singapore, Romania, South Africa and the United Kingdom, welcoming creatives from further afield. We welcome you to days of using creativity, in its many forms.<br><br>“<em>From the rising of the sun unto the going down of the same, the Lord''s name be praised!”</em> </div><div>Psalm 113 : 3</div>', 'Page', 1, '2022-09-17 21:13:57.591636', '2023-06-26 11:58:07.144675', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (213, 'title', 'History', 'Page', 5, '2023-05-24 22:48:03.269659', '2023-06-26 12:17:03.063106', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (215, 'title', 'Finance', 'Page', 6, '2023-05-24 22:48:37.218417', '2023-05-24 22:48:37.218417', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (218, 'title', 'Boş', 'TimeSlot', 15, '2023-06-14 22:10:03.762203', '2023-06-14 22:10:03.762203', 'tr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (221, 'presenter_bio', '<div><strong>Cath and Angus</strong><br>Cath and Angus MacGregor are worship leaders and songwriters. Their heart is to pursue, enjoy intimacy and encounter with God, and to co-labour with Him to establish His Kingdom on earth, as it is in Heaven. Their  latest adventure, The Dwelling Place Trail, takes them across the UK into people’s homes to worship, warfare, and soak in God’s presence, pursuing healing, freedom, and breakthrough for all. They live in Sowerby Bridge with their cat Moses.<br><a href="https://www.cathandangusmusic.com/">https://www.cathandangusmusic.com/</a> and <a href="http://facebook.com/cathandangusmusic">Facebook</a><br><br><strong>Joe and Jemma Aiken</strong><br>Joe and Jemma Aiken have been leading worship together for 16 years as a husband and wife team. Their latest EP ‘Building Your Kingdom’ has featured on UCB2 Christian radio in the UK with six songs from the last three releases being added to the UCB2 radio playlist. They are regular worship leaders at their local church, The Vine Church, Suffolk, UK, and also part of the church leadership team as treasurer and secretary. Search ‘Joe Aiken Music’ for <a href="https://www.facebook.com/Joe-Aiken-Music-131704936945061">Facebook</a>, <a href="https://instagram.com/joe.aiken.music?utm_medium=copy_link">Instagram</a>, and <a href="https://open.spotify.com/artist/48Y3X0nDdIBIuzXxJMsSFv">Spotify</a>.<br><br><strong>Job Tan</strong><br>Job Tan cultivated a conscious and close relationship with the Lord Jesus from his youth, his faith journey has taken him to extreme ends of highs and lows. His training in music is wide and deep, playing &amp; tuning the piano, playing a few instruments, composing, improvising, writing, and teaching. He is married with 3 children.<br>You can find Job Tan''s music on <a href="https://youtube.com/playlist?list=PLJ5FrT1fUtLZ0kH8e-oBPWKuadLU5bt62">YouTube</a> here</div>', 'Session', 8, '2023-06-17 19:13:05.20174', '2023-06-17 19:13:05.20174', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (224, 'requirements', '', 'Session', 10, '2023-06-19 22:06:46.942028', '2023-06-19 22:06:46.942028', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (225, 'presenter_bio_override', '', 'Session', 10, '2023-06-19 22:06:46.946107', '2023-06-19 22:06:46.946107', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (226, 'presenter_bio_override', '', 'Session', 9, '2023-06-19 22:15:51.932956', '2023-06-19 22:15:51.932956', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (227, 'presenter_bio_override', '', 'Session', 12, '2023-06-19 22:24:18.059832', '2023-06-19 22:24:18.059832', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (230, 'presenter_bio_override', '', 'Session', 15, '2023-06-19 22:38:21.151357', '2023-06-19 22:38:21.151357', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (232, 'bio', '<div>Birte Papenhausen is a drama-theologian, missionary with WEC, and member of ArtsRelease. She inspires faith through theatre so that the Bible is better understood, God is loved more deeply and faith is lived out in everyday life.<br><br>Her desire is to pass on her knowledge and passion for God and theatre by training others. Besides playback, she teaches orality courses and is on the staff at Cornerstone Bible School in the Netherlands.<br><br>See her website for more details: <a href="https://www.theater-anstoss-zum-glauben.de/">https://www.theater-anstoss-zum-glauben.de/</a></div>', 'Presenter', 16, '2023-06-19 22:42:34.770319', '2023-06-19 22:42:34.770319', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (236, 'title', 'The 15-Minute Songwriter', 'Session', 21, '2023-06-19 22:46:01.159377', '2023-06-19 22:46:01.159377', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (120, 'description', '<div>Venez assister à des performances improvisées en direct d''histoires vraies ! Dans cette expérience, vous pourrez partager une histoire, écouter les histoires des autres et regarder une équipe internationale d''acteurs les interpréter de manière créative sans aucune répétition !<br><br>Apportez votre histoire et votre témoignage de moments de restauration dans votre vie. Participez à cette expérience unique pour avoir la chance de faire jouer votre histoire. Ou venez simplement regarder et être béni.<br><br><strong>Partage et chat informels (30 min +) succèdent au Playback Theatre.<br></strong><br>Le théâtre de lecture en ligne sera suivi d''un moment informel pour continuer à partager vos histoires, discuter ensemble, réseauter ou poser des questions. Vous pouvez soit rester dans la pièce principale, soit demander une salle de sous-commission.<br><br>Les acteurs : Tim, Alison, Birte, Sook Neo, Swee, Dawn, Andrew, Elke (musique), Han (assistance technique). Les acteurs ont été formés par Birte au théâtre de lecture en ligne et vivent dans plusieurs pays d''Europe et d''Asie. Ils font partie de deux groupes de théâtre de lecture et c''est la première fois qu''ils jouent ensemble.</div>', 'Session', 18, '2022-12-18 00:45:08.480294', '2023-06-21 22:10:50.471969', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (98, 'description', '<div>Come and watch some live improvised performances of true stories! In this experience, you will be able to share a story, listen to others'' stories, and watch an international team of actors perform them in creative ways without any rehearsal at all!<br><br>Bring your story and testimony of times of restoration in your life. Join in this unique experience to have a  chance to have your story acted out. Or simply come to watch and be blessed.<br><br><strong>Informal share and chat (30 mins +) follow on from Playback Theatre.</strong><br><br> The online playback theatre will be followed by an informal time for you to carry on sharing your stories, chat together, network or ask questions. You can either stay in the main room or request a breakout room.</div>', 'Session', 18, '2022-12-17 18:52:00.784537', '2023-06-19 22:43:32.841832', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (234, 'presenter_bio_override', '<div>Birte Papenhausen is a drama-theologian, missionary with WEC, and member of ArtsRelease. She inspires faith through theatre so that the Bible is better understood, God is loved more deeply and faith is lived out in everyday life. Her desire is to pass on her knowledge and passion for God and theatre by training others. Besides playback, she teaches orality courses and is on the staff at Cornerstone Bible School in the Netherlands. See her website for more details: <a href="https://www.theater-anstoss-zum-glauben.de">https://www.theater-anstoss-zum-glauben.de</a><br><br>The Actors: Tim, Alison, Birte, Sook Neo, Swee, Dawn, Andrew, Elke (music), Han (technical assistance). The actors have been trained by Birte in online playback theatre and live in a number of countries in Europe and Asia. They are from two playback theatre groups and this is the first time they are acting together.</div>', 'Session', 18, '2023-06-19 22:42:42.710298', '2023-06-19 22:43:32.864095', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (240, 'bio', '<div>My name is Emilia. Together with my husband, Young Tae, I have been teaching ceramics in our studio in Romania since 2013. I studied ceramic art, painting, and theology in Romania and South Korea. We also run a zoom meeting every Saturday morning, a Christian creative studio (Art Release inspired).</div>', 'Presenter', 17, '2023-06-19 22:47:38.381879', '2023-06-19 22:47:38.381879', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (241, 'title', 'Restoration Collaging', 'Session', 22, '2023-06-19 22:47:49.250472', '2023-06-19 22:47:49.250472', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (242, 'description', '<div>Community with the Spirit and with each other, good relationships and fellowship brings healing and growth. In this workshop, we will paint several papers in different colours and tear them to reconstruct them into a healthy- looking tree. The idea is that we are all broken, but within a healing community, we can become something strong, beautiful, and nourishing together.</div>', 'Session', 22, '2023-06-19 22:47:49.253359', '2023-06-19 22:47:49.253359', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (243, 'requirements', '<ul><li>Papers</li><li>Watercolours or poster paints</li><li>Brushes</li><li>Glue stick</li></ul>', 'Session', 22, '2023-06-19 22:47:49.257352', '2023-06-19 22:47:49.257352', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (285, 'requirements', '', 'Session', 18, '2023-06-21 22:10:50.485766', '2023-06-21 22:10:50.485766', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (286, 'presenter_bio_override', '<div>Birte est théologienne du théâtre, missionnaire du WEC et membre d''ArtsRelease. Elle inspire la foi par le théâtre afin que la Bible soit mieux comprise, que Dieu soit aimé plus profondément et que la foi soit vécue dans la vie quotidienne. Son désir est de transmettre ses connaissances et sa passion pour Dieu et le théâtre en formant d''autres personnes. Outre la lecture, elle donne des cours d''oralité et fait partie du personnel de l''école biblique Cornerstone aux Pays-Bas.<br><br>Consultez son site Web pour plus de détails : <a href="https://www.theater-anstoss-zum-glauben.de/">https://www.theater-anstoss-zum-glauben.de/</a><br><br>Les Comédiens : Tim, Alison, Birte, Sook Neo, Swee, Dawn, Andrew, Elke (musique), Han (assistance technique). Les comédiens ont été formés par Birte au théâtre playback en ligne et vivent dans plusieurs pays d''Europe et d''Asie. Ils sont issus de deux groupes de théâtre playback et c''est la première fois qu''ils jouent ensemble.</div>', 'Session', 18, '2023-06-21 22:10:50.489564', '2023-06-21 22:10:50.489564', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (287, 'title', 'Artist Chat', 'Session', 25, '2023-06-21 22:14:24.472024', '2023-06-21 22:14:24.472024', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (288, 'description', '<div>Ewa will show and talk us through some of her work and techniques. We will hear about her faith and testimony with time for some audience questions.</div>', 'Session', 25, '2023-06-21 22:14:24.476138', '2023-06-21 22:14:24.476138', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (237, 'description', '<div>Rome wasn’t built in a day - but the core of a good song can be written in only a few minutes. Join this hands-on workshop to pick up some tips and cheap hacks on how to capture and encourage musical and lyrical inspiration for song-writing when time is limited - or you are writing in a language that isn’t your mother tongue. Discover how it’s actually easier to be creative when the sky isn’t the limit! There’ll be time to “do your own thing” as part of the workshop as well.</div>', 'Session', 21, '2023-06-19 22:46:01.16128', '2023-06-19 22:46:01.16128', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (238, 'requirements', '<ul><li>If you’re an instrumentalist, you will want access to your instrument(s)</li><li>Paper, pencil - and a rubber!</li><li>A bible will probably come in handy as well</li></ul>', 'Session', 21, '2023-06-19 22:46:01.165306', '2023-06-19 22:46:01.165306', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (290, 'presenter_bio_override', '<div>Ewa Rossano has presented her works at many individual and collective exhibitions at home and abroad (including the European Parliament in Brussels, the Council of Europe in Strasbourg, the Ossolineum in Wrocław, UNESCO and OECD in Paris, the City Museum in Reykjavik). There are two of her monuments in Wrocław: the Crystal Planet at the entrance to the Four Temples District and Angelus Silesius in the Ossoline Garden.<br><br>Ewa Rossano''s work is characterised by combining two materials: bronze and glass. The latter often appears in her works in the form of a colourful pâte de Verre. The intensive use of colour and colour spots proves the artist''s painting predilections and makes her art to be perceived as interdisciplinary, drawing on various techniques and artistic means of expression.<br><br><a href="https://www.ewarossano.com">www.ewarossano.com</a></div>', 'Session', 25, '2023-06-21 22:14:24.487553', '2023-06-21 22:14:24.487553', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (247, 'title', 'Dance Improv & Listening to God', 'Session', 23, '2023-06-21 21:37:49.603942', '2023-06-21 21:37:49.603942', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (248, 'description', '<div>Learn improvisation techniques that can be used when dancing during worship or privately. Allow the Holy Spirit to inspire movements as we listen to His promptings.</div>', 'Session', 23, '2023-06-21 21:37:49.60836', '2023-06-21 21:37:49.60836', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (251, 'title', 'Henna Storytelling', 'Session', 24, '2023-06-21 21:42:03.947326', '2023-06-21 21:42:03.947326', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (252, 'description', '<div>It is a delight when your joy of art can combine with that of sharing Materials needed (optional):your faith. Henna naturally draws a crowd, whether in the mud-brick homes of Chad or in street festivals in Europe, as Fiona discovered. She will share the basics and tips in this taster workshop on how to apply henna, how to find designs and resources and how to combine it with sharing stories, verses, or testimonies. If you are brave enough to have a go practicing a henna design see below for what materials you will need. You can just watch and ask questions!<br><br>Here is a website resource for the workshop: <a href="https://www.hennastories.org/">https://www.hennastories.org/</a></div>', 'Session', 24, '2023-06-21 21:42:03.950132', '2023-06-21 21:42:03.950132', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (89, 'description', '<div>Deep calls out to deep at the sound of your waterfalls (Psalm 42:7). This is a time of being tucked away with God using simple collage as a way of going deeper with Him and knowing His voice.</div>', 'Session', 14, '2022-12-17 18:46:10.159717', '2023-06-21 21:43:49.756197', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (253, 'requirements', '<div>Materials needed (optional):</div><ul><li>Fresh Henna cones* (100% organic henna), sometimes called “henna mehndi cones”</li><li>Latex or plastic gloves</li><li>Paper towels</li><li>A person willing to have you henna them (can be done on yourself), or a piece of paper as an alternative.</li></ul><div>*Bought henna cones can be frozen and defrosted 20 mins before use to keep them fresh. You will only need 1 cone for the workshop!<br><br>A company that ships internationally (based in UK, USA &amp; Canada) can be found <a href="https://www.ak-products.com/collections/henna-cones">here</a>. The site has useful tips<br>and estimated quantities for coverage needed. You may find cheaper henna cones on other websites in many<br>different countries.</div>', 'Session', 24, '2023-06-21 21:42:03.957279', '2023-06-21 21:47:30.541806', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (254, 'presenter_bio_override', '<div>Fiona Fung is a self-taught visual artist who enjoys learning the arts of the countries she has lived in. She is with ArtsRelease France and runs the “Studio Créatif'''' from her current home in Normandy. To see some of her work in general check out her Instagram: @fionafungart</div>', 'Session', 24, '2023-06-21 21:42:03.963859', '2023-06-21 21:47:30.557778', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (200, 'requirements', '<div>For those that want to have a go at playing with inks during the workshop they will need:<br><br></div><ul><li>Some acrylic inks</li><li>Watercolour paper and brushes</li><li>Some pre-cut paper shapes e.g., circles, or thin flat objects from nature like leaves</li><li>Optional extras: Masking fluid, art roller, textured surfaces, ink dip pen, blue watercolour pencil.</li></ul><div><br></div><div>If you have no inks and do not yet want to <a href="https://www.amazon.co.uk/Liquitex-Professional-Acrylic-Ink-Essentials/dp/B071WQ9VC4">invest</a> in some, bring along your watercolours! Or just watch the session as a demo.</div>', 'Session', 17, '2023-02-06 22:46:14.589609', '2023-06-21 21:50:53.481384', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (255, 'title', 'Courant 1', 'Session', 6, '2023-06-21 21:52:26.680649', '2023-06-21 21:52:26.680649', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (256, 'description', '<div>Lindsey animera une méditation sur Luc 15 :11-32, la parabole du fils prodigue. Après la méditation, vous aurez le temps de créer une œuvre, une danse, une chanson ou une musique en réponse à l''histoire. Au cours de la session de partage, nous reviendrons ensemble et partagerons nos travaux et nos idées en petits groupes.</div>', 'Session', 6, '2023-06-21 21:52:26.683802', '2023-06-21 21:52:26.683802', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (257, 'requirements', '', 'Session', 6, '2023-06-21 21:52:26.689814', '2023-06-21 21:52:26.689814', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (258, 'presenter_bio_override', '', 'Session', 6, '2023-06-21 21:52:26.692968', '2023-06-21 21:52:26.692968', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (154, 'description', '<div>Rejoignez-nous pour une compilation de chants et de musiques de louange. Les participants sont encouragés à créer tout en écoutant les chants de louange. N''hésitez pas à jouer d''un instrument, danser, chanter, peindre, dessiner, sculpter, écrire ou créer toute autre forme de culte.</div>', 'Session', 8, '2022-12-19 23:31:57.818062', '2023-06-21 21:54:52.154636', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (312, 'body', '<div>Le Creative Studio est une initiative Arts Release qui a commencé avec l''un de ses membres, Tun I, qui dirigeait un studio de création en personne dans une église au Royaume-Uni, explorant Dieu et la Bible à l''aide des arts. Pendant le confinement covid, Tun I a mis en ligne le studio de création dans un format simple et facilement reproductible. À partir de là, le nombre de ces studios virtuels a augmenté et continue de croître à travers le monde, que ce soit en ligne ou, maintenant, en personne.<br><br>[ajouter des informations sur les studios de création hebdomadaires et mensuels dans différents pays et fuseaux horaires]<br><br>Puis en 2022, est venue l''idée du Global Creative Studio Day (GCSD), de rassembler virtuellement ces studios pour une journée de créativité de 24 heures, car les studios s''étendent sur de nombreux fuseaux horaires, mais aussi de l''ouvrir à quiconque aimerait rejoignez et profitez de la journée.</div>', 'Page', 5, '2023-06-25 20:36:36.30313', '2023-06-26 12:17:52.823333', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (260, 'presenter_bio_override', '<div><strong>Cath et Angus</strong><br>Cath et Angus MacGregor sont des leaders de louange et des auteurs de chansons. Leur cœur est de poursuivre et d''apprécier l''intimité et la rencontre avec Dieu, et de collaborer avec lui pour établir son royaume sur terre, comme au ciel. Leur dernière aventure, The Dwelling Place Trail, les emmène à travers le Royaume-Uni dans les maisons des gens pour adorer, guerroyer et s''imprégner de la présence de Dieu, en quête de guérison, de liberté et de percée pour tous. Ils vivent à Sowerby Bridge avec leur chat Moses. <a href="https://www.cathandangusmusic.com/">https://www.cathandangusmusic.com/</a> and <a href="http://facebook.com/cathandangusmusic">Facebook</a><br><br><strong>Joe et Jemma Aiken</strong><br>Joe et Jemma Aiken dirigent la louange ensemble depuis 16 ans en tant qu''équipe mari et femme. Leur dernier EP ''Building Your Kingdom'' a été diffusé sur la radio chrétienne UCB2 au Royaume-Uni, et six chansons des trois dernières versions ont été ajoutées à la liste de lecture de la radio UCB2. Ils sont des leaders de louange réguliers dans leur église locale, The Vine Church, Suffolk, UK et font également partie de l''équipe de direction de l''église en tant que trésorier et secrétaire. Cherchez "Joe Aiken Music" sur <a href="https://www.facebook.com/Joe-Aiken-Music-131704936945061">Facebook</a>, <a href="https://instagram.com/joe.aiken.music?utm_medium=copy_link">Instagram</a> et <a href="https://open.spotify.com/artist/48Y3X0nDdIBIuzXxJMsSFv">Spotify</a>.<br><br><strong>Job Tan</strong><br>Job Tan a cultivé une relation consciente et étroite avec le Seigneur Jésus depuis son plus jeune âge, son voyage dans la foi l''a conduit à des hauts et de bas extrêmes. Sa formation musicale est vaste et profonde : il joue et accorde le piano, joue de quelques instruments, compose, improvise, écrit et enseigne. Il est marié et a trois enfants. Vous pouvez trouver la musique de Job Tan sur <a href="https://youtube.com/playlist?list=PLJ5FrT1fUtLZ0kH8e-oBPWKuadLU5bt62">YouTube</a>.</div>', 'Session', 8, '2023-06-21 21:54:52.172333', '2023-06-21 21:54:52.172333', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (262, 'description', '<div>Chris parlera des moyens créatifs avant-gardistes afin d’apporter la Bonne Nouvelle autour de nous.</div>', 'Session', 13, '2023-06-21 21:57:02.030213', '2023-06-21 21:57:02.030213', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (291, 'bio', '', 'Presenter', 18, '2023-06-21 22:15:18.416911', '2023-06-21 22:15:18.416911', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (292, 'title', 'Stream 2 (sharing)', 'Session', 26, '2023-06-21 22:17:05.113305', '2023-06-21 22:17:05.113305', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (265, 'bio', '<div>Chris Duffett est évangéliste et artiste. Il est l’ancien président de l’union baptiste de Grande Bretagne et fondateur du Collectif Collège de la Lumière. Il a une riche expérience en théologie, aumônerie ainsi qu’en art et culture. Il est l’auteur de quatre livres. Le dernier est une nouvelle traitant de son héros, Philippe l’évangéliste.<br><br><a href="https://www.chrisduffettart.com">www.chrisduffettart.com</a><br><a href="https://lightcollege.ac.uk/">lightcollege.ac.uk</a></div>', 'Presenter', 14, '2023-06-21 21:57:55.580629', '2023-06-21 21:57:55.580629', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (261, 'title', 'Du Studio a la Rue', 'Session', 13, '2023-06-21 21:57:02.027696', '2023-06-21 21:58:21.099589', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (293, 'description', '<div>Come back and share what you created with the rest of the group.</div>', 'Session', 26, '2023-06-21 22:17:05.115511', '2023-06-21 22:17:05.115511', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (296, 'title', 'Break 2', 'TimeSlot', 16, '2023-06-21 22:19:55.777202', '2023-06-21 22:19:55.777202', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (297, 'title', 'Break 3', 'TimeSlot', 17, '2023-06-21 22:20:58.888561', '2023-06-21 22:20:58.888561', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (26, 'title', 'GCSD April 2022: Restoration', 'Event', 1, '2022-11-07 17:53:44.796733', '2023-06-26 12:08:30.757085', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (58, 'description', '<div>Our creative studios from around the globe open their virtual doors for a day of creativity on the theme, “from the shadow”. Following for a day the earth’s shadow around the sun, over the 24 hours we will explore the shadows over us, and from where we go forth using our creativity to express reflections of God. <br><br></div><div>With a choice of over 20 workshops run by art practitioners from around the world, you can:<br><br></div><ul><li>Meditate on scripture using art in worship and prayer. </li><li>Listen to the prophetic through song, writing, dance, collage … and more. </li><li>Learn more creative skills.</li><li>Find out how artists are using art to come alongside people in the shadows and bringing them into God’s shadow through participatory workshops. </li><li>Be inspired by our two invited guests to the artist chats: <a href="https://www.patrickbezalel.com/">Patrick Bezalel</a>, a hyper-realist fine artist from Singapore &amp; and <a href="https://cocombassi.co.uk/">Coco Mbassi</a>, musician and singer Franco-Camourounaise.</li><li>Listen to your stories through improvised theatre.</li></ul><div><br>And, a chance to chat and share with other creatives around the world.<br><br></div><div>After registering, you will receive details to join us over Zoom and Discord nearer the date.</div>', 'Event', 6, '2022-12-08 15:44:26.60525', '2023-06-26 12:06:06.068726', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (4, 'body', '<div>The Global Creative Studio Day is a 24 hour event of creativity, in its many forms, such as meditation, creative and communal worship, workshops, and artist talks. <br><br></div><div>Join us as our online studios can come to your homes! It is for those who have a desire to be creative, no matter the degree of talent. <br><br></div><div>The GCSD is hosted by <a href="https://artsrelease.org/">Arts Release</a> and a community of Christians from all walks of life with virtual and physical studios that meet in Australia, France, New Zealand, Singapore, Romania, South Africa and the United Kingdom, and welcomes creatives from further afield. <br><br></div><div>The main aims for the day are:</div><div><br></div><ul><li><strong>WONDER</strong> to keep our sense of wonder and spark our creativity by learning and sharing with each other. </li><li><strong>CONNECT</strong> To enrich our connectivity and relationship with God and other creatives.   </li><li><strong>INQUISITIVE</strong> to sharpen our inquisitiveness by learning new approaches or skills.</li><li><strong>BEYOND THE STUDIO</strong> To take our art and creativity beyond the studio to using it and the arts for God’s kingdom purposes.</li></ul><div><br></div><div>These aims reflect the wide variety of workshops and plenary sessions offered on the day. Although the GCSD is online, we try to make it as experiential as possible. We endeavour to increase the scope of representation arts and artists from different cultures to make it a truly global event.</div>', 'Page', 2, '2022-10-04 14:44:13.252688', '2023-06-26 12:14:23.770038', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (212, 'body', '<div>The Creative Studio is an <a href="https://artsrelease.org/">Arts Release</a> initiative that started with one of its members, Tun I, who was running an in-person creative studio at a church in the UK, exploring God and the Bible using the arts. During covid lock down, Tun I put the creative studio online in a simple and easily reproducible format. From that the number of these virtual studios grew and still continues growing across the globe, whether on-line or, now, in-person.<br><br></div><div>[add information about weekly and monthly creative studios in different countries and time zones]<br><br></div><div>Then in 2022, came the idea of the Global Creative Studio Day (GCSD), to virtually gather these studios for a 24-hr day of creativity, as the studios stretch over many time zones, but also opening it up to whoever would love to join and benefit from the day.</div>', 'Page', 5, '2023-05-24 22:48:03.260904', '2023-06-26 12:17:03.048277', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (310, 'body', '<div>Le Global Creative Studio Day est un événement de créativité 24 heures sur 24, sous ses nombreuses formes, telles que la méditation, le culte créatif et communautaire, les ateliers et les conférences d''artistes.<br><br>Rejoignez-nous car nos studios en ligne peuvent venir chez vous ! C''est pour ceux qui ont envie d''être créatifs, quel que soit leur degré de talent.<br><br>Le GCSD est hébergé par <a href="https://artsrelease.org/fr/intro">Arts Release</a> et une communauté de chrétiens de tous horizons avec des studios virtuels et physiques qui se réunissent en Australie, en France, en Nouvelle-Zélande, à Singapour, en Roumanie, en Afrique du Sud et au Royaume-Uni, et accueille des créatifs de plus loin.<br><br>Les principaux objectifs de la journée sont :<br><br></div><ul><li><strong>WONDER</strong> pour garder notre sens de l''émerveillement et stimuler notre créativité en apprenant et en partageant les uns avec les autres.</li><li><strong>CONNECT</strong> Pour enrichir notre connectivité et notre relation avec Dieu et les autres créatifs.</li><li><strong>CHERCHEUR</strong> pour aiguiser notre curiosité en apprenant de nouvelles approches ou compétences.</li><li><strong>AU-DELÀ DU STUDIO</strong> Pour amener notre art et notre créativité au-delà du studio pour l''utiliser et utiliser les arts pour les objectifs du royaume de Dieu.</li></ul><div><br>Ces objectifs reflètent la grande variété d''ateliers et de séances plénières offerts au cours de la journée. Bien que le GCSD soit en ligne, nous essayons de le rendre aussi expérientiel que possible. Nous nous efforçons d''élargir la portée des arts de représentation et des artistes de différentes cultures pour en faire un événement véritablement mondial.</div>', 'Page', 2, '2023-06-25 20:35:35.431867', '2023-06-26 12:19:34.91378', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (214, 'body', '<div>Held online, means more people can have affordable access around the world, and, reflects the environmental concerns of our members. Our artists and organisers have willingly given of their expertise and time for free, for which we are immensely grateful of their generous spirit. However, it would be befitting if we could give them some remunerative gift. And, there are overhead costs of running online events, as well as to continue to develop a quality program. <br><br></div><div>Thus, we do suggest for those that can afford it to pay a small inscription fee to help towards running the day, but it remains a suggestion only. As this suggested inscription fee does not cover all our costs, and, for those who wish also to bless someone by paying an inscription fee for them, there is also the possibility to donate to the event. </div>', 'Page', 6, '2023-05-24 22:48:37.21352', '2023-06-26 12:21:46.933621', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (308, 'body', '<div>Tenu en ligne, signifie que plus de personnes peuvent avoir un accès abordable dans le monde entier et reflète les préoccupations environnementales de nos membres. Nos artistes et organisateurs ont volontairement donné de leur expertise et de leur temps gratuitement, ce pour quoi nous sommes extrêmement reconnaissants de leur esprit généreux. Cependant, il serait bon que nous puissions leur faire un cadeau rémunérateur. Et, il y a des frais généraux pour organiser des événements en ligne, ainsi que pour continuer à développer un programme de qualité.<br><br>Ainsi, nous suggérons à ceux qui en ont les moyens de payer un petit droit d''inscription pour aider à la gestion de la journée, mais cela reste une suggestion. Comme ces frais d''inscription suggérés ne couvrent pas tous nos frais, et, pour ceux qui souhaitent également bénir quelqu''un en payant des frais d''inscription pour eux, il y a aussi la possibilité de faire un don à l''événement.</div>', 'Page', 6, '2023-06-25 20:34:02.034614', '2023-06-26 12:22:04.595858', 'fr');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (245, 'requirements', '<div>Workshop participants can join as ‘viewers only’. Anyone wishing to take part practically will need the following:</div><ul><li>A broken or chipped ceramic plate, bowl, or vase</li><li>Rapid setting (5-minute epoxy) glue (from Amazon <a href="https://www.amazon.co.uk/JB-Weld-TRA50112-TEX-ClearWeld-Setting/dp/B009EU5ZM0/ref=pd_lpo_3?pd_rd_i=B009EU5ZM0&amp;psc=1">here</a> or <a href="https://www.amazon.co.uk/Gorilla-Glue-25ml-Epoxy/dp/B009NQQJFC/ref=sr_1_5?crid=1KF17C0U4XM8U&amp;keywords=fast+set+epoxy+glue+environmentally+friendly&amp;qid=1645546429&amp;s=industrial&amp;sprefix=fast+set+epoxy+glue+evironmentallly+friendly%2Cindustrial%2C109&amp;sr=1-5">here</a>)</li><li>Gold mica powder (from <a href="https://warm-glass.co.uk/sparkle-bright-gold-mica-powder-30g-p-2082.html">Warm Glass</a> or <a href="https://www.amazon.co.uk/Powder-Wtrcsv-Pigment-Natural-Colouring/dp/B08L4L3XXP/ref=sr_1_1_sspa?keywords=Gold+mica&amp;qid=1645546880&amp;sr=8-1-spons&amp;psc=1&amp;spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyQjhYWFg5SlZKMEVXJmVuY3J5cHRlZElkPUEwOTYxMzAyMVZTSTU1MTA1WVNINSZlbmNyeXB0ZWRBZElkPUEwMzI3OTgxMTNBMlE1S0VPWlpFUiZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU=">Amazon</a>)</li><li>A few cocktail sticks or equivalent for mixing glue</li><li>Recycled plastic pot (e.g. a yoghurt pot) or scrap card for mixing</li><li>glue</li><li>Piece of scrap paper to protect the table</li><li>Blue or white tack</li><li>Vinyl gloves if you have skin sensitivity to epoxy resin</li></ul>', 'Session', 16, '2023-06-19 22:49:24.078208', '2023-06-26 23:06:00.218293', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (315, 'presenter_bio_override', '', 'Session', 16, '2023-06-26 23:06:00.23139', '2023-06-26 23:06:00.23139', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (222, 'presenter_bio_override', '<div><strong>Cath and Angus MacGregor</strong><br>Cath and Angus are worship leaders and songwriters. Their heart is to pursue, enjoy intimacy and encounter with God, and to co-labour with Him to establish His Kingdom on earth, as it is in Heaven. Their latest adventure, The Dwelling Place Trail, takes them across the UK into people’s homes to worship, warfare, and soak in God’s presence, pursuing healing, freedom, and breakthrough for all. They live in Sowerby Bridge with their cat Moses. <a href="https://www.cathandangusmusic.com/">www.cathandangusmusic.com</a> and Facebook<br><br><strong>Joe and Jemma Aiken</strong><br>Joe and Jemma have been leading worship together for 16 years as a husband and wife team. Their latest EP ‘Building Your Kingdom’ has featured on UCB2 Christian radio in the UK with six songs from the last three releases being added to the UCB2 radio playlist. They are regular worship leaders at their local church, The Vine Church, Suffolk, UK, and also part of the church leadership team as treasurer and secretary. Search ‘Joe Aiken Music’ for Facebook, Instagram, and Spotify.<br><br><strong>Job Tan</strong><br>Job cultivated a conscious and close relationship with the Lord Jesus from his youth, his faith journey has taken him to extreme ends of highs n lows. His training in music is wide and deep, playing &amp; tuning the piano, playing a few instruments, composing, improvising, writing, and teaching. He is married with 3 children. You can find Job Tan''s music on YouTube <a href="https://youtube.com/playlist?list=PLJ5FrT1fUtLZ0kH8e-oBPWKuadLU5bt62">here</a></div>', 'Session', 8, '2023-06-18 22:13:32.066827', '2023-06-28 14:49:47.096207', 'en');
INSERT INTO public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at, locale) VALUES (197, 'description', '<div>Nos studios de création du monde entier vous ouvrent leurs portes virtuelles pour une journée de créativité sur le thème "de l''ombre". En suivant pendant une journée l''ombre de la terre autour du soleil, au cours des 24 heures, nous explorerons les ombres au-dessus de nous et d''où nous irons en utilisant notre créativité pour exprimer les reflets de Dieu.<br><br>Avec un choix de plus de 20 ateliers animés par des praticiens de l''art du monde entier, vous pourrez :<br><br></div><ul><li>Méditez sur les Écritures en utilisant l''art dans l''adoration et la prière.</li><li>Écoutez le prophétique à travers la chanson, l''écriture, la danse, le collage… et plus encore.</li><li>Apprenez plus de compétences créatives.</li><li>Découvrez comment les artistes utilisent l''art pour côtoyer les personnes dans l''ombre et les amener dans l''ombre de Dieu à travers des ateliers participatifs.</li><li>Laissez-vous inspirer par nos deux invités aux causeries d''artistes : Patrick Bezalel, un artiste hyper-réaliste de Singapour &amp; et Coco Mbassi, musicien et chanteur Franco-Camourounaise.</li><li>Écoutez vos histoires à travers le théâtre improvisé.</li></ul><div><br>Et, une chance de discuter et de partager avec d''autres créatifs du monde entier.<br><br>Après votre inscription, vous recevrez les détails pour nous rejoindre sur Zoom et Discord plus près de la date.</div>', 'Event', 6, '2023-02-01 22:47:12.512605', '2023-06-28 22:56:32.051678', 'fr');


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (3, 'featured_image', 'Event', 1, 3, '2022-09-17 21:15:33.906263');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (4, 'image', 'ActiveStorage::VariantRecord', 2, 4, '2022-09-17 21:15:34.069631');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (5, 'featured_image', 'Event', 2, 5, '2022-09-17 21:16:47.39812');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (6, 'image', 'ActiveStorage::VariantRecord', 3, 6, '2022-09-17 21:16:47.553094');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (7, 'profile_image', 'User', 1, 7, '2022-09-17 21:18:37.626279');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (8, 'image', 'ActiveStorage::VariantRecord', 4, 8, '2022-09-17 21:18:37.825516');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (9, 'featured_image', 'Page', 2, 9, '2022-11-04 17:21:11.571143');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (10, 'image', 'ActiveStorage::VariantRecord', 5, 10, '2022-11-04 17:21:11.872943');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (11, 'featured_image', 'Presenter', 1, 11, '2022-12-17 22:42:57.791665');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (12, 'image', 'ActiveStorage::VariantRecord', 6, 12, '2022-12-17 22:42:57.97608');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (41, 'featured_image', 'Session', 13, 41, '2023-05-08 21:04:47.792921');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (42, 'image', 'ActiveStorage::VariantRecord', 21, 42, '2023-05-08 21:04:48.093112');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (45, 'featured_image', 'Session', 16, 45, '2023-06-15 20:17:48.962783');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (46, 'image', 'ActiveStorage::VariantRecord', 23, 46, '2023-06-15 20:17:49.322942');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (51, 'featured_image', 'Session', 8, 51, '2023-06-19 22:05:40.024292');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (52, 'image', 'ActiveStorage::VariantRecord', 27, 52, '2023-06-19 22:05:40.306388');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (53, 'featured_image', 'Session', 10, 53, '2023-06-19 22:06:46.955527');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (54, 'image', 'ActiveStorage::VariantRecord', 28, 54, '2023-06-19 22:06:47.186292');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (55, 'featured_image', 'Session', 9, 55, '2023-06-19 22:15:51.942753');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (56, 'image', 'ActiveStorage::VariantRecord', 29, 56, '2023-06-19 22:15:52.218974');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (57, 'featured_image', 'Session', 12, 57, '2023-06-19 22:24:18.070544');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (58, 'image', 'ActiveStorage::VariantRecord', 30, 58, '2023-06-19 22:24:18.336008');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (59, 'featured_image', 'Session', 11, 59, '2023-06-19 22:25:28.142072');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (60, 'image', 'ActiveStorage::VariantRecord', 31, 60, '2023-06-19 22:25:28.393226');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (61, 'featured_image', 'Session', 14, 61, '2023-06-19 22:37:54.716733');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (62, 'image', 'ActiveStorage::VariantRecord', 32, 62, '2023-06-19 22:37:54.967036');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (63, 'featured_image', 'Session', 15, 63, '2023-06-19 22:38:21.16111');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (64, 'image', 'ActiveStorage::VariantRecord', 33, 64, '2023-06-19 22:38:21.416626');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (65, 'featured_image', 'Session', 17, 65, '2023-06-19 22:38:50.199054');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (66, 'image', 'ActiveStorage::VariantRecord', 34, 66, '2023-06-19 22:38:50.463056');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (67, 'featured_image', 'Session', 18, 67, '2023-06-19 22:42:42.721065');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (68, 'image', 'ActiveStorage::VariantRecord', 35, 68, '2023-06-19 22:42:42.943992');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (69, 'featured_image', 'Session', 21, 69, '2023-06-19 22:46:01.174997');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (70, 'image', 'ActiveStorage::VariantRecord', 36, 70, '2023-06-19 22:46:01.474775');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (71, 'featured_image', 'Session', 22, 71, '2023-06-19 22:47:49.266889');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (72, 'image', 'ActiveStorage::VariantRecord', 37, 72, '2023-06-19 22:47:49.485534');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (73, 'featured_image', 'Session', 23, 73, '2023-06-21 21:37:49.639851');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (74, 'image', 'ActiveStorage::VariantRecord', 38, 74, '2023-06-21 21:37:50.006407');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (75, 'featured_image', 'Session', 24, 75, '2023-06-21 21:42:03.982959');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (76, 'image', 'ActiveStorage::VariantRecord', 39, 76, '2023-06-21 21:42:04.20115');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (77, 'featured_image', 'Session', 25, 77, '2023-06-21 22:14:24.510786');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (78, 'image', 'ActiveStorage::VariantRecord', 40, 78, '2023-06-21 22:14:24.774991');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (81, 'featured_image', 'Event', 6, 81, '2023-06-26 20:06:46.843681');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (82, 'image', 'ActiveStorage::VariantRecord', 42, 82, '2023-06-26 20:06:47.207065');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (95, 'featured_image', 'Page', 1, 95, '2023-06-26 20:25:53.261132');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (96, 'image', 'ActiveStorage::VariantRecord', 51, 96, '2023-06-26 20:25:53.889074');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (97, 'image', 'ActiveStorage::VariantRecord', 52, 97, '2023-06-26 20:25:58.435154');
INSERT INTO public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) VALUES (98, 'image', 'ActiveStorage::VariantRecord', 53, 98, '2023-06-28 22:55:26.230428');


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (3, 'z2j6yqag0sztzwu0fnt27xjre01h', 'Chris Duffett Pic.jpg', 'image/jpeg', '{"identified":true,"width":1440,"height":838,"analyzed":true}', 'local', 221465, 'FD4yVvb6fmumlAm0FEGICA==', '2022-09-17 21:15:33.904781');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (4, 'n9y9qfhhhj3ay78rqbepcq20n62x', 'Chris Duffett Pic.jpg', 'image/jpeg', '{"identified":true,"width":50,"height":29,"analyzed":true}', 'local', 2075, 'IHzZ/Gmm24JPbB37Kif22g==', '2022-09-17 21:15:34.067967');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (5, '3y8t79e0grx711of84ezc9j3tv2b', 'Chris Duffett Pic.jpg', 'image/jpeg', '{"identified":true,"width":1440,"height":838,"analyzed":true}', 'local', 221465, 'FD4yVvb6fmumlAm0FEGICA==', '2022-09-17 21:16:47.396497');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (6, '4gqk097gl2f6tdtr3u7b2295ig4r', 'Chris Duffett Pic.jpg', 'image/jpeg', '{"identified":true,"width":50,"height":29,"analyzed":true}', 'local', 2075, 'IHzZ/Gmm24JPbB37Kif22g==', '2022-09-17 21:16:47.55142');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (7, '5qq12afrm0whlpyjpy3ucotvg396', '2017 06 CdeB round.png', 'image/png', '{"identified":true,"width":1192,"height":1192,"analyzed":true}', 'local', 583643, 'Hv7dKE5oWlRXcq9JjOL2nA==', '2022-09-17 21:18:37.624753');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (8, 'wtuqw6ted9rz4djacc69a09evz21', '2017 06 CdeB round.png', 'image/png', '{"identified":true,"width":50,"height":50,"analyzed":true}', 'local', 15752, 'p2hwvL0B7HrVH1SpuyTbSw==', '2022-09-17 21:18:37.823746');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (9, 'xn87ibltix9efy0sorewws0ogkea', 'St Michael at Bowes cable access picture.png', 'image/png', '{"identified":true,"width":925,"height":511,"analyzed":true}', 'local', 933450, '/d21xawTCi4mrwg1barRfQ==', '2022-11-04 17:21:11.567217');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (10, 'dbfmqebracwyi1xffc63aqdqvdeb', 'St Michael at Bowes cable access picture.png', 'image/png', '{"identified":true,"width":50,"height":28,"analyzed":true}', 'local', 4069, 'q01VZWWzOFHpDJtpjv+jag==', '2022-11-04 17:21:11.871237');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (11, 'ktwmlqwhjnzi136h52dohb73jg69', 'Screenshot from 2022-12-17 22-31-32.png', 'image/png', '{"identified":true,"width":218,"height":304,"analyzed":true}', 'local', 137748, '9ki8tMYd3lHFoedy7BORXg==', '2022-12-17 22:42:57.78956');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (12, 'g6xjwa5e7jsxdxk8ohiijnojl3cn', 'Screenshot from 2022-12-17 22-31-32.png', 'image/png', '{"identified":true,"width":36,"height":50,"analyzed":true}', 'local', 4925, 'lF1gz+jim6UM0MtBvsjWeg==', '2022-12-17 22:42:57.97425');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (51, 'lkjhhcmusw79nz981kwpxxig0mmo', 'Chris Duffett Pic.jpg', 'image/jpeg', '{"identified":true,"width":1440,"height":838,"analyzed":true}', 'local', 221465, 'FD4yVvb6fmumlAm0FEGICA==', '2023-06-19 22:05:40.020987');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (52, 'l4awlfmc8iqz4cjnyzmukvf2hgtf', 'Chris Duffett Pic.jpg', 'image/jpeg', '{"identified":true,"width":50,"height":29,"analyzed":true}', 'local', 2057, 'RZDx/R1o93PlzTZrEY14SQ==', '2023-06-19 22:05:40.304619');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (53, '3ekwu4c6j6x8euq7g61vgv25cbs2', 'AK.png', 'image/png', '{"identified":true,"width":548,"height":864,"analyzed":true}', 'local', 482674, 'lKN+QUcceEbgbTcKxXluGg==', '2023-06-19 22:06:46.952446');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (54, 'h6ptniuv71epgh9cqet7p8tyjuj9', 'AK.png', 'image/png', '{"identified":true,"width":32,"height":50,"analyzed":true}', 'local', 4053, 'toPzjctyY5leUIqC3xGhbA==', '2023-06-19 22:06:47.184556');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (45, 'qh360rww079hqj7rtpxnluokr304', 'kintsugi.png', 'image/png', '{"identified":true,"width":360,"height":328,"analyzed":true}', 'local', 209604, 'o75GSQXo7km37yOteYgtug==', '2023-06-15 20:17:48.959952');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (46, '97c17fg8gcu1ghoihtlly22yah06', 'kintsugi.png', 'image/png', '{"identified":true,"width":50,"height":45,"analyzed":true}', 'local', 6852, 'EtXx59x/U+fTePxOV5aQlg==', '2023-06-15 20:17:49.321086');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (41, 'cztjb1adbhaikddyakeozab1q3mc', 'Chris Duffett.png', 'image/png', '{"identified":true,"width":1154,"height":766,"analyzed":true}', 'local', 849752, 'zZ8S9o0f+sU4g13OCUwVnQ==', '2023-05-08 21:04:47.789363');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (42, '49ctnb4bd5vl1keediimxga3tq5h', 'Chris Duffett.png', 'image/png', '{"identified":true,"width":50,"height":33,"analyzed":true}', 'local', 4428, '6h1OGuj0C3/SfmXth4J4uw==', '2023-05-08 21:04:48.089489');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (55, '5ulprbvx9p21nidxvjq79pmb5s8r', 'Caz Campbell.png', 'image/png', '{"identified":true,"width":388,"height":548,"analyzed":true}', 'local', 404377, 'TP31kpdrdNf7dnyoBBylpA==', '2023-06-19 22:15:51.940068');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (56, 'h5e1li265pjafpn98ckofvdaiao8', 'Caz Campbell.png', 'image/png', '{"identified":true,"width":36,"height":50,"analyzed":true}', 'local', 4946, 'LzfQJlb+JI4ddbJYjj8fYQ==', '2023-06-19 22:15:52.215891');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (57, 'x4x0mvb288qwoyud904e25k4smfa', 'Journaling and Healing.png', 'image/png', '{"identified":true,"width":724,"height":1080,"analyzed":true}', 'local', 1232000, 'RwB9Q2cFTFSZxtAKxVx9rQ==', '2023-06-19 22:24:18.06767');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (58, 'cgbf5ikz8oqkwvijez2i4in3jifx', 'Journaling and Healing.png', 'image/png', '{"identified":true,"width":33,"height":50,"analyzed":true}', 'local', 4512, '1eTKkXh9I31PfztYehF/1w==', '2023-06-19 22:24:18.334308');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (59, 'uh99lpj7uap05bftfkh4t2na3vu7', 'Light Up with Batik.png', 'image/png', '{"identified":true,"width":702,"height":996,"analyzed":true}', 'local', 1194213, 'Qr99H2TXFnyxqaVKs/TmjQ==', '2023-06-19 22:25:28.140359');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (60, 'iov7jlbfzmqlj37dc8lal9spwbhd', 'Light Up with Batik.png', 'image/png', '{"identified":true,"width":35,"height":50,"analyzed":true}', 'local', 5124, 'ncDmWoQZv7aimjxJA5HHbQ==', '2023-06-19 22:25:28.391372');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (61, '7c5987ts9uglrgcgh13nrbs1lu4o', 'deep-pockets.jpg', 'image/jpeg', '{"identified":true,"width":2204,"height":1098,"analyzed":true}', 'local', 278642, 'bDnABEupaRk+JcE/0LppJQ==', '2023-06-19 22:37:54.714703');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (62, '1u7gl9pd2i4typtqz0au0k281sbk', 'deep-pockets.jpg', 'image/jpeg', '{"identified":true,"width":50,"height":25,"analyzed":true}', 'local', 1309, '/lgPuYF0EgCm+PvxkPW95g==', '2023-06-19 22:37:54.964025');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (63, 'vuti4n4m0p9f9gkfj6gp8dpyo6vl', 'origami-hearts.jpg', 'image/jpeg', '{"identified":true,"width":1460,"height":1098,"analyzed":true}', 'local', 160071, '+mQEKPMqZLXzcR8JZrOA9g==', '2023-06-19 22:38:21.158239');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (64, 'loa23ihbr3vw0vyl6lqynpr8nww1', 'origami-hearts.jpg', 'image/jpeg', '{"identified":true,"width":50,"height":37,"analyzed":true}', 'local', 1563, 'CG8tWpCzgOE2VzJ275B85A==', '2023-06-19 22:38:21.413956');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (65, 'nn75pdpq1jko8sui86fdv0z7y14t', 'Acrylic Inks.png', 'image/png', '{"identified":true,"width":832,"height":1110,"analyzed":true}', 'local', 1197947, 'aijb4vJ1LXr6e7wwBWslXA==', '2023-06-19 22:38:50.195684');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (66, '0hkx14nht1uqq6hi9du3yfmi4v7o', 'Acrylic Inks.png', 'image/png', '{"identified":true,"width":38,"height":50,"analyzed":true}', 'local', 5366, '8t70/PZX6OTDDiKGrM26Sg==', '2023-06-19 22:38:50.460854');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (67, 'v3e7f8b8h1qjik8ukkzxa00ohl6q', 'playback-theatre.jpg', 'image/jpeg', '{"identified":true,"width":1506,"height":1128,"analyzed":true}', 'local', 126264, '732+eijTwL8RdXl7MZErCw==', '2023-06-19 22:42:42.719338');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (68, 'ox1g6q0tpw92lb988ot4pr1zy28s', 'playback-theatre.jpg', 'image/jpeg', '{"identified":true,"width":50,"height":37,"analyzed":true}', 'local', 1515, '9T6us4KcrMXD23U1r8hEZg==', '2023-06-19 22:42:42.942041');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (69, 'j1sgw2r1lk74pr7k3dq32xq03u5l', '15-minute-songwriter.png', 'image/png', '{"identified":true,"width":1091,"height":1330,"analyzed":true}', 'local', 2362837, 'Exl71Pb3Z0IruHxv3sIsAQ==', '2023-06-19 22:46:01.173476');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (95, 'vtky88hftj35whma01ysdvn0bagk', 'Logo - Colour.webp', 'image/webp', '{"identified":true,"width":3862,"height":4071,"analyzed":true}', 'local', 592046, 'V3ETFsoc6wZJ9236jCwRaA==', '2023-06-26 20:25:53.258472');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (98, '0ayzv6q07b3e4gqzrbe6fupz3xz9', 'Studio Créatif(4).webp', 'image/webp', '{"identified":true,"width":50,"height":50,"analyzed":true}', 'local', 5300, 'H7FFtOn0DLVPjYPDe9cxgQ==', '2023-06-28 22:55:26.22705');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (70, 'zh9pvjvs1ljbn587z33eyol5s9ca', '15-minute-songwriter.png', 'image/png', '{"identified":true,"width":41,"height":50,"analyzed":true}', 'local', 5995, 'fXlaKUj9omga4XYAcV1Ryg==', '2023-06-19 22:46:01.471702');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (71, 'ny6q2ka24m97837ckyest6mqg9e5', 'restoration-collaging.jpg', 'image/jpeg', '{"identified":true,"width":974,"height":972,"analyzed":true}', 'local', 83598, '5OQ+jVZZnvk1vpcDIPUOAQ==', '2023-06-19 22:47:49.265285');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (72, 'zaxvhsimaiagizubjfo4le8f5puj', 'restoration-collaging.jpg', 'image/jpeg', '{"identified":true,"width":50,"height":50,"analyzed":true}', 'local', 1877, 'vCl6Ok+ylQPsrzZwcoAScg==', '2023-06-19 22:47:49.482483');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (73, 'rtouo74p2dpr8yucwbs1tyxsfuvu', 'AK.png', 'image/png', '{"identified":true,"width":548,"height":864,"analyzed":true}', 'local', 482674, 'lKN+QUcceEbgbTcKxXluGg==', '2023-06-21 21:37:49.635705');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (74, 'zzkph0luxg69in91sucrzdtkpk3p', 'AK.png', 'image/png', '{"identified":true,"width":32,"height":50,"analyzed":true}', 'local', 4053, 'toPzjctyY5leUIqC3xGhbA==', '2023-06-21 21:37:50.004645');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (75, 'shp8vxm8c98kknshslmd43e32nyv', 'henna-storytelling.jpg', 'image/jpeg', '{"identified":true,"width":740,"height":990,"analyzed":true}', 'local', 126980, 'aRWIdKXmyNDxqA5XfE9SHQ==', '2023-06-21 21:42:03.980326');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (76, 'nv2qh8ndxs4oiveshprbigcjh9s0', 'henna-storytelling.jpg', 'image/jpeg', '{"identified":true,"width":37,"height":50,"analyzed":true}', 'local', 1700, 'QHsZpa71pE9urHns7blrww==', '2023-06-21 21:42:04.199423');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (77, 'liufo8o9ajec46bnceonw6r3gb77', 'Ewa-Rossano.png', 'image/png', '{"identified":true,"width":796,"height":796,"analyzed":true}', 'local', 574990, 'kmKApMJRVcDG+cBJsT9IFA==', '2023-06-21 22:14:24.508708');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (78, 'jtqnba6t4remu59b282hqdu1tkpz', 'Ewa-Rossano.png', 'image/png', '{"identified":true,"width":50,"height":50,"analyzed":true}', 'local', 6162, 'A7vC/f7dAog/wog/ewJKow==', '2023-06-21 22:14:24.771815');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (81, 'u8tjvzn0lxntldkdtvux40akoe7g', 'Studio Créatif(4).webp', 'image/webp', '{"identified":true,"width":1080,"height":1080,"analyzed":true}', 'local', 70702, 'BaxXxT/mSgP0Dqhdnxt5gQ==', '2023-06-26 20:06:46.84053');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (82, 'eynd9jz1kz6jgz5ycen6qpadxrlu', 'Studio Créatif(4).png', 'image/png', '{"identified":true,"width":50,"height":50,"analyzed":true}', 'local', 5953, 'BRfa6oM4K7upEEpqSDr+Hw==', '2023-06-26 20:06:47.203746');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (96, 'wk0um21uwcsc1sm97imsuyc8qe5v', 'Logo - Colour.webp', 'image/webp', '{"identified":true,"width":48,"height":50,"analyzed":true}', 'local', 2592, 'LFEvP31TQVXA//lEpSOrZQ==', '2023-06-26 20:25:53.885989');
INSERT INTO public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) VALUES (97, '7r2vjit0oermuveb2eoo1k3gabwi', 'Logo - Colour.webp', 'image/webp', '{"identified":true,"width":616,"height":650,"analyzed":true}', 'local', 67998, 'rbTgjaF0gprPZ9dUVEguyw==', '2023-06-26 20:25:58.433261');


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (2, 3, '2LUGSpqeAxE2FTbZR5KExFsl26Y=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (3, 5, '2LUGSpqeAxE2FTbZR5KExFsl26Y=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (4, 7, 'ZmDfamq3DaAOqmqEnqBAWE4VJTE=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (5, 9, 'ZmDfamq3DaAOqmqEnqBAWE4VJTE=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (6, 11, 'ZmDfamq3DaAOqmqEnqBAWE4VJTE=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (21, 41, 'ZmDfamq3DaAOqmqEnqBAWE4VJTE=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (23, 45, 'ZmDfamq3DaAOqmqEnqBAWE4VJTE=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (27, 51, '2LUGSpqeAxE2FTbZR5KExFsl26Y=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (28, 53, 'ZmDfamq3DaAOqmqEnqBAWE4VJTE=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (29, 55, 'ZmDfamq3DaAOqmqEnqBAWE4VJTE=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (30, 57, 'ZmDfamq3DaAOqmqEnqBAWE4VJTE=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (31, 59, 'ZmDfamq3DaAOqmqEnqBAWE4VJTE=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (32, 61, '2LUGSpqeAxE2FTbZR5KExFsl26Y=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (33, 63, '2LUGSpqeAxE2FTbZR5KExFsl26Y=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (34, 65, 'ZmDfamq3DaAOqmqEnqBAWE4VJTE=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (35, 67, '2LUGSpqeAxE2FTbZR5KExFsl26Y=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (36, 69, 'ZmDfamq3DaAOqmqEnqBAWE4VJTE=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (37, 71, '2LUGSpqeAxE2FTbZR5KExFsl26Y=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (38, 73, 'ZmDfamq3DaAOqmqEnqBAWE4VJTE=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (39, 75, '2LUGSpqeAxE2FTbZR5KExFsl26Y=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (40, 77, 'ZmDfamq3DaAOqmqEnqBAWE4VJTE=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (42, 81, 'fVSI3ErivJVnAXMTIgvlmxrdlMk=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (51, 95, '3Knt7GbS0vlBU0/si0scNtEOTQc=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (52, 95, '6NJI+zqRUZOznqrGNrF5JoLkdGI=');
INSERT INTO public.active_storage_variant_records (id, blob_id, variation_digest) VALUES (53, 81, 'cnp9YYOZ0WLg/T+dMKzMPqwbRbE=');


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.events (id, starting_at, is_featured, created_at, updated_at, slug, finishing_at, status, registration_url) VALUES (1, '2022-04-04 04:00:00+03', false, '2022-09-18 00:15:33.895817+03', '2023-06-26 15:23:58.158312+03', 'gcsd-april-2022', '2022-04-04 21:30:00+03', 2, 'http://sdsdfdfd.com');
INSERT INTO public.events (id, starting_at, is_featured, created_at, updated_at, slug, finishing_at, status, registration_url) VALUES (6, '2023-10-07 03:00:00+03', true, '2022-12-08 18:44:26.601694+03', '2023-06-29 01:56:32.062483+03', 'gcsd-october-2023', '2023-10-08 03:00:00+03', 1, '');


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.pages (id, slug, created_at, updated_at) VALUES (5, 'history', '2023-05-25 01:48:03.230235+03', '2023-06-26 15:17:52.835801+03');
INSERT INTO public.pages (id, slug, created_at, updated_at) VALUES (2, 'about', '2022-10-04 17:44:13.242085+03', '2023-06-26 15:19:34.923908+03');
INSERT INTO public.pages (id, slug, created_at, updated_at) VALUES (6, 'finance', '2023-05-25 01:48:37.211257+03', '2023-06-26 15:22:04.604832+03');
INSERT INTO public.pages (id, slug, created_at, updated_at) VALUES (1, 'home', '2022-09-18 00:13:57.589256+03', '2023-06-26 23:25:53.263432+03');


--
-- Data for Name: presenters; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.presenters (id, name, created_at, updated_at) VALUES (7, 'Fiona Fung', '2022-12-20 02:11:41.419706+03', '2022-12-20 02:12:44.094556+03');
INSERT INTO public.presenters (id, name, created_at, updated_at) VALUES (5, 'Lin Wei', '2022-12-20 02:09:33.376422+03', '2022-12-20 02:13:35.561839+03');
INSERT INTO public.presenters (id, name, created_at, updated_at) VALUES (6, 'Liz Waugh McManus', '2022-12-20 02:10:56.634225+03', '2022-12-20 02:14:18.276835+03');
INSERT INTO public.presenters (id, name, created_at, updated_at) VALUES (8, 'Cath & Angus', '2022-12-20 02:33:15.414266+03', '2022-12-20 02:34:19.757686+03');
INSERT INTO public.presenters (id, name, created_at, updated_at) VALUES (9, 'Joe & Jemma Aiken', '2022-12-20 02:34:51.684926+03', '2022-12-20 02:36:05.547345+03');
INSERT INTO public.presenters (id, name, created_at, updated_at) VALUES (11, 'Lindsey Parker', '2022-12-20 02:37:54.588165+03', '2022-12-20 02:38:05.39693+03');
INSERT INTO public.presenters (id, name, created_at, updated_at) VALUES (12, 'Dave Stockwell', '2022-12-20 02:38:25.413561+03', '2022-12-20 02:38:25.420703+03');
INSERT INTO public.presenters (id, name, created_at, updated_at) VALUES (10, 'Job Tan', '2022-12-20 02:36:37.694307+03', '2022-12-20 03:01:20.972252+03');
INSERT INTO public.presenters (id, name, created_at, updated_at) VALUES (13, 'Anne Soh', '2022-12-20 03:02:03.16756+03', '2023-02-07 02:34:44.49355+03');
INSERT INTO public.presenters (id, name, created_at, updated_at) VALUES (2, 'Caz Campbell', '2022-12-20 01:54:10.785377+03', '2023-06-17 20:37:12.053809+03');
INSERT INTO public.presenters (id, name, created_at, updated_at) VALUES (4, 'Iris Low', '2022-12-20 01:58:59.182974+03', '2023-06-20 01:26:22.408662+03');
INSERT INTO public.presenters (id, name, created_at, updated_at) VALUES (3, 'A.K. Jesudason', '2022-12-20 01:55:59.537762+03', '2023-06-22 00:55:25.277639+03');
INSERT INTO public.presenters (id, name, created_at, updated_at) VALUES (14, 'Chris Duffett', '2023-02-07 01:09:46.900064+03', '2023-06-22 00:57:55.584123+03');
INSERT INTO public.presenters (id, name, created_at, updated_at) VALUES (15, 'Jude Wooley', '2023-02-07 02:37:12.002167+03', '2023-06-22 01:06:15.90287+03');
INSERT INTO public.presenters (id, name, created_at, updated_at) VALUES (16, 'Birte Papenhausen', '2023-06-20 01:42:34.764354+03', '2023-06-22 01:07:17.817834+03');
INSERT INTO public.presenters (id, name, created_at, updated_at) VALUES (17, 'Emilia Cristea', '2023-06-20 01:47:38.374973+03', '2023-06-22 01:08:26.672836+03');
INSERT INTO public.presenters (id, name, created_at, updated_at) VALUES (18, 'Ewa Rossano', '2023-06-22 01:15:18.411288+03', '2023-06-22 01:15:18.419445+03');


--
-- Data for Name: presenters_sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.presenters_sessions (session_id, presenter_id) VALUES (9, 2);
INSERT INTO public.presenters_sessions (session_id, presenter_id) VALUES (10, 3);
INSERT INTO public.presenters_sessions (session_id, presenter_id) VALUES (11, 4);
INSERT INTO public.presenters_sessions (session_id, presenter_id) VALUES (12, 5);
INSERT INTO public.presenters_sessions (session_id, presenter_id) VALUES (16, 6);
INSERT INTO public.presenters_sessions (session_id, presenter_id) VALUES (17, 7);
INSERT INTO public.presenters_sessions (session_id, presenter_id) VALUES (8, 8);
INSERT INTO public.presenters_sessions (session_id, presenter_id) VALUES (8, 9);
INSERT INTO public.presenters_sessions (session_id, presenter_id) VALUES (8, 10);
INSERT INTO public.presenters_sessions (session_id, presenter_id) VALUES (6, 11);
INSERT INTO public.presenters_sessions (session_id, presenter_id) VALUES (7, 11);
INSERT INTO public.presenters_sessions (session_id, presenter_id) VALUES (20, 12);
INSERT INTO public.presenters_sessions (session_id, presenter_id) VALUES (15, 13);
INSERT INTO public.presenters_sessions (session_id, presenter_id) VALUES (13, 14);
INSERT INTO public.presenters_sessions (session_id, presenter_id) VALUES (14, 15);
INSERT INTO public.presenters_sessions (session_id, presenter_id) VALUES (18, 16);
INSERT INTO public.presenters_sessions (session_id, presenter_id) VALUES (22, 17);
INSERT INTO public.presenters_sessions (session_id, presenter_id) VALUES (23, 3);
INSERT INTO public.presenters_sessions (session_id, presenter_id) VALUES (24, 7);
INSERT INTO public.presenters_sessions (session_id, presenter_id) VALUES (25, 18);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.schema_migrations (version) VALUES ('20220524213358');
INSERT INTO public.schema_migrations (version) VALUES ('20220609220009');
INSERT INTO public.schema_migrations (version) VALUES ('20220612212512');
INSERT INTO public.schema_migrations (version) VALUES ('20220621221611');
INSERT INTO public.schema_migrations (version) VALUES ('20220623222815');
INSERT INTO public.schema_migrations (version) VALUES ('20220710210856');
INSERT INTO public.schema_migrations (version) VALUES ('20220711134553');
INSERT INTO public.schema_migrations (version) VALUES ('20220711134554');
INSERT INTO public.schema_migrations (version) VALUES ('20220711224005');
INSERT INTO public.schema_migrations (version) VALUES ('20220714203357');
INSERT INTO public.schema_migrations (version) VALUES ('20220715223802');
INSERT INTO public.schema_migrations (version) VALUES ('20220726060231');
INSERT INTO public.schema_migrations (version) VALUES ('20220828003626');
INSERT INTO public.schema_migrations (version) VALUES ('20220903213625');
INSERT INTO public.schema_migrations (version) VALUES ('20220919205829');
INSERT INTO public.schema_migrations (version) VALUES ('20221006221916');
INSERT INTO public.schema_migrations (version) VALUES ('20221121175153');
INSERT INTO public.schema_migrations (version) VALUES ('20221208155133');
INSERT INTO public.schema_migrations (version) VALUES ('20221212225301');
INSERT INTO public.schema_migrations (version) VALUES ('20221212231005');
INSERT INTO public.schema_migrations (version) VALUES ('20221217182852');
INSERT INTO public.schema_migrations (version) VALUES ('20221217220640');
INSERT INTO public.schema_migrations (version) VALUES ('20221217222307');
INSERT INTO public.schema_migrations (version) VALUES ('20221219223919');
INSERT INTO public.schema_migrations (version) VALUES ('20230122220645');
INSERT INTO public.schema_migrations (version) VALUES ('20230123171322');
INSERT INTO public.schema_migrations (version) VALUES ('20230123175037');
INSERT INTO public.schema_migrations (version) VALUES ('20230123204147');
INSERT INTO public.schema_migrations (version) VALUES ('20230129204853');
INSERT INTO public.schema_migrations (version) VALUES ('20230524131124');
INSERT INTO public.schema_migrations (version) VALUES ('20230525171238');
INSERT INTO public.schema_migrations (version) VALUES ('20230617171620');
INSERT INTO public.schema_migrations (version) VALUES ('20230617185222');
INSERT INTO public.schema_migrations (version) VALUES ('20230621204520');


--
-- Data for Name: session_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.session_types (id, order_by, created_at, updated_at) VALUES (5, 10, '2022-11-26 02:52:58.919626+03', '2022-12-07 19:37:49.255634+03');
INSERT INTO public.session_types (id, order_by, created_at, updated_at) VALUES (6, 20, '2022-11-26 02:52:58.923553+03', '2022-12-13 02:49:53.085931+03');
INSERT INTO public.session_types (id, order_by, created_at, updated_at) VALUES (8, 30, '2022-12-13 02:27:11.383186+03', '2022-12-20 02:44:46.197553+03');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions (id, "limit", event_id, session_type_id, created_at, updated_at, time_slot_id, presenter_bio_override) VALUES (10, NULL, 1, 6, '2022-12-13 02:59:47.235361+03', '2023-06-20 01:06:46.958227+03', 4, NULL);
INSERT INTO public.sessions (id, "limit", event_id, session_type_id, created_at, updated_at, time_slot_id, presenter_bio_override) VALUES (9, NULL, 1, 6, '2022-12-13 02:59:09.509402+03', '2023-06-20 01:15:51.945233+03', 4, NULL);
INSERT INTO public.sessions (id, "limit", event_id, session_type_id, created_at, updated_at, time_slot_id, presenter_bio_override) VALUES (12, 15, 1, 6, '2022-12-13 03:01:57.945071+03', '2023-06-20 01:24:18.073005+03', 4, NULL);
INSERT INTO public.sessions (id, "limit", event_id, session_type_id, created_at, updated_at, time_slot_id, presenter_bio_override) VALUES (15, NULL, 1, 6, '2022-12-17 21:46:56.085859+03', '2023-06-20 01:38:21.163923+03', 8, NULL);
INSERT INTO public.sessions (id, "limit", event_id, session_type_id, created_at, updated_at, time_slot_id, presenter_bio_override) VALUES (14, NULL, 1, 6, '2022-12-17 21:46:10.157009+03', '2023-06-22 00:43:49.775729+03', 8, NULL);
INSERT INTO public.sessions (id, "limit", event_id, session_type_id, created_at, updated_at, time_slot_id, presenter_bio_override) VALUES (11, NULL, 1, 6, '2022-12-13 03:00:37.955655+03', '2023-06-22 00:46:27.352625+03', 4, NULL);
INSERT INTO public.sessions (id, "limit", event_id, session_type_id, created_at, updated_at, time_slot_id, presenter_bio_override) VALUES (17, NULL, 1, 6, '2022-12-17 21:48:19.388607+03', '2023-06-22 00:50:53.488382+03', 8, NULL);
INSERT INTO public.sessions (id, "limit", event_id, session_type_id, created_at, updated_at, time_slot_id, presenter_bio_override) VALUES (6, NULL, 1, 8, '2022-12-13 02:27:57.349996+03', '2023-06-22 00:52:26.695506+03', 1, NULL);
INSERT INTO public.sessions (id, "limit", event_id, session_type_id, created_at, updated_at, time_slot_id, presenter_bio_override) VALUES (13, NULL, 1, 5, '2022-12-17 21:44:02.898825+03', '2023-06-22 00:58:21.10228+03', 5, NULL);
INSERT INTO public.sessions (id, "limit", event_id, session_type_id, created_at, updated_at, time_slot_id, presenter_bio_override) VALUES (21, NULL, 1, 6, '2023-06-20 01:46:01.155601+03', '2023-06-22 01:00:33.657531+03', 14, NULL);
INSERT INTO public.sessions (id, "limit", event_id, session_type_id, created_at, updated_at, time_slot_id, presenter_bio_override) VALUES (20, NULL, 1, 8, '2022-12-20 02:40:27.319036+03', '2022-12-20 02:41:05.770464+03', 10, NULL);
INSERT INTO public.sessions (id, "limit", event_id, session_type_id, created_at, updated_at, time_slot_id, presenter_bio_override) VALUES (7, NULL, 1, 8, '2022-12-13 02:33:50.95276+03', '2022-12-20 02:44:15.863779+03', 2, NULL);
INSERT INTO public.sessions (id, "limit", event_id, session_type_id, created_at, updated_at, time_slot_id, presenter_bio_override) VALUES (22, NULL, 1, 6, '2023-06-20 01:47:49.247578+03', '2023-06-22 01:01:48.75449+03', 14, NULL);
INSERT INTO public.sessions (id, "limit", event_id, session_type_id, created_at, updated_at, time_slot_id, presenter_bio_override) VALUES (24, NULL, 1, 6, '2023-06-22 00:42:03.944682+03', '2023-06-22 01:04:04.866864+03', NULL, NULL);
INSERT INTO public.sessions (id, "limit", event_id, session_type_id, created_at, updated_at, time_slot_id, presenter_bio_override) VALUES (23, NULL, 1, 6, '2023-06-22 00:37:49.599867+03', '2023-06-22 01:08:47.992714+03', NULL, NULL);
INSERT INTO public.sessions (id, "limit", event_id, session_type_id, created_at, updated_at, time_slot_id, presenter_bio_override) VALUES (18, NULL, 1, 6, '2022-12-17 21:52:00.781335+03', '2023-06-22 01:10:50.49225+03', 9, NULL);
INSERT INTO public.sessions (id, "limit", event_id, session_type_id, created_at, updated_at, time_slot_id, presenter_bio_override) VALUES (26, NULL, 1, 8, '2023-06-22 01:17:05.1115+03', '2023-06-22 01:24:45.940568+03', NULL, NULL);
INSERT INTO public.sessions (id, "limit", event_id, session_type_id, created_at, updated_at, time_slot_id, presenter_bio_override) VALUES (25, NULL, 1, 5, '2023-06-22 01:14:24.468407+03', '2023-06-22 01:26:05.251349+03', NULL, NULL);
INSERT INTO public.sessions (id, "limit", event_id, session_type_id, created_at, updated_at, time_slot_id, presenter_bio_override) VALUES (16, NULL, 1, 6, '2022-12-17 21:47:37.687288+03', '2023-06-27 02:06:00.23304+03', 8, NULL);
INSERT INTO public.sessions (id, "limit", event_id, session_type_id, created_at, updated_at, time_slot_id, presenter_bio_override) VALUES (8, NULL, 1, 5, '2022-12-13 02:35:48.870063+03', '2023-06-28 17:51:22.108439+03', 3, NULL);


--
-- Data for Name: sessions_time_slots; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (8, 3);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (10, 4);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (9, 4);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (12, 4);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (11, 4);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (14, 8);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (15, 8);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (6, 1);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (17, 8);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (18, 9);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (21, 14);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (22, 14);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (16, 8);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (20, 10);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (7, 2);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (13, 5);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (21, 11);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (15, 14);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (16, 14);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (23, 11);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (24, 11);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (14, 11);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (25, 12);
INSERT INTO public.sessions_time_slots (session_id, time_slot_id) VALUES (26, 13);


--
-- Data for Name: time_slots; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.time_slots (id, event_id, starting_at, finishing_at, created_at, updated_at) VALUES (1, 1, '2022-04-02 04:00:00+03', '2022-04-02 04:40:00+03', '2022-12-13 02:07:02.631072+03', '2023-02-04 02:23:35.741253+03');
INSERT INTO public.time_slots (id, event_id, starting_at, finishing_at, created_at, updated_at) VALUES (2, 1, '2022-04-02 08:00:00+03', '2022-04-02 09:00:00+03', '2022-12-13 02:32:11.391038+03', '2023-02-04 02:24:41.063961+03');
INSERT INTO public.time_slots (id, event_id, starting_at, finishing_at, created_at, updated_at) VALUES (4, 1, '2022-04-02 10:00:00+03', '2022-04-02 10:50:00+03', '2022-12-13 02:56:49.732457+03', '2023-02-04 02:25:37.601827+03');
INSERT INTO public.time_slots (id, event_id, starting_at, finishing_at, created_at, updated_at) VALUES (5, 1, '2022-04-02 11:00:00+03', '2022-04-02 11:50:00+03', '2022-12-13 02:57:13.165511+03', '2023-02-04 02:25:55.350319+03');
INSERT INTO public.time_slots (id, event_id, starting_at, finishing_at, created_at, updated_at) VALUES (8, 1, '2022-04-02 12:00:00+03', '2022-04-02 13:00:00+03', '2022-12-17 21:45:14.745988+03', '2023-02-04 02:26:21.922868+03');
INSERT INTO public.time_slots (id, event_id, starting_at, finishing_at, created_at, updated_at) VALUES (9, 1, '2022-04-02 13:00:00+03', '2022-04-02 14:30:00+03', '2022-12-17 21:49:21.23666+03', '2023-02-04 02:26:54.593499+03');
INSERT INTO public.time_slots (id, event_id, starting_at, finishing_at, created_at, updated_at) VALUES (10, 1, '2022-04-02 14:30:00+03', '2022-04-02 15:00:00+03', '2022-12-17 21:53:37.158133+03', '2023-02-04 02:27:28.899556+03');
INSERT INTO public.time_slots (id, event_id, starting_at, finishing_at, created_at, updated_at) VALUES (14, 1, '2022-04-02 17:00:00+03', '2022-04-02 18:00:00+03', '2022-12-20 02:52:22.931489+03', '2023-02-04 02:27:49.905074+03');
INSERT INTO public.time_slots (id, event_id, starting_at, finishing_at, created_at, updated_at) VALUES (11, 1, '2022-04-02 18:00:00+03', '2022-04-02 19:00:00+03', '2022-12-17 23:27:31.781944+03', '2023-02-04 02:28:31.074249+03');
INSERT INTO public.time_slots (id, event_id, starting_at, finishing_at, created_at, updated_at) VALUES (12, 1, '2022-04-02 19:00:00+03', '2022-04-02 20:00:00+03', '2022-12-17 23:28:04.579713+03', '2023-02-04 02:28:54.449053+03');
INSERT INTO public.time_slots (id, event_id, starting_at, finishing_at, created_at, updated_at) VALUES (13, 1, '2022-04-02 21:30:00+03', '2022-04-02 22:30:00+03', '2022-12-17 23:28:44.005054+03', '2023-02-04 02:29:21.285576+03');
INSERT INTO public.time_slots (id, event_id, starting_at, finishing_at, created_at, updated_at) VALUES (3, 1, '2022-04-02 09:00:00+03', '2022-04-02 09:50:00+03', '2022-12-13 02:32:43.637383+03', '2023-02-05 02:47:40.130165+03');
INSERT INTO public.time_slots (id, event_id, starting_at, finishing_at, created_at, updated_at) VALUES (15, 1, '2022-04-02 04:30:00+03', '2022-04-02 08:00:00+03', '2023-06-15 00:56:37.974664+03', '2023-06-22 01:21:32.29077+03');
INSERT INTO public.time_slots (id, event_id, starting_at, finishing_at, created_at, updated_at) VALUES (16, 1, '2022-04-02 15:00:00+03', '2022-04-02 17:00:00+03', '2023-06-22 01:19:55.773662+03', '2023-06-22 01:21:51.86155+03');
INSERT INTO public.time_slots (id, event_id, starting_at, finishing_at, created_at, updated_at) VALUES (17, 1, '2022-04-02 20:00:00+03', '2022-04-02 21:30:00+03', '2023-06-22 01:20:58.886213+03', '2023-06-22 01:22:02.867983+03');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, first_name, last_name, role, created_at, updated_at, time_zone, locale) VALUES (2, 'charlesdeb@hotmail.com', '$2a$12$zFzs3ull2m1DKc.Df2iFyuzocqyGuRdsuJoYKDAlhSbNmybiOyr2G', NULL, NULL, NULL, 1, '2023-01-17 22:09:59.170014', '2023-01-17 22:09:59.170014', '::1', '::1', 'Charles', 'Noface', 0, '2023-01-17 22:09:34.02933', '2023-01-17 22:09:59.170199', 'London', 'en');
INSERT INTO public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, first_name, last_name, role, created_at, updated_at, time_zone, locale) VALUES (1, 'chabekah@gmail.com', '$2a$12$5uzuqOtUOpEat2ZBxe.W1etYVeyX2BJw/BvAd7kO1sRUgdg9PHgi.', '', NULL, '2023-06-21 21:30:26.706446', 64, '2023-06-28 22:10:58.959545', '2023-06-28 14:42:53.340826', '::1', '::1', 'Charles', 'de Bueger', 2, '2022-09-17 21:10:08.062205', '2023-06-28 22:10:58.959744', 'London', 'en');


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.action_text_rich_texts_id_seq', 317, true);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 98, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 98, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 53, true);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.events_id_seq', 6, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_id_seq', 6, true);


--
-- Name: presenters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.presenters_id_seq', 18, true);


--
-- Name: session_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.session_types_id_seq', 8, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 26, true);


--
-- Name: time_slots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.time_slots_id_seq', 17, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: action_text_rich_texts action_text_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_text_rich_texts
    ADD CONSTRAINT action_text_rich_texts_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: presenters presenters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.presenters
    ADD CONSTRAINT presenters_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: session_types session_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session_types
    ADD CONSTRAINT session_types_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: time_slots time_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.time_slots
    ADD CONSTRAINT time_slots_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_action_text_rich_texts_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_action_text_rich_texts_uniqueness ON public.action_text_rich_texts USING btree (record_type, record_id, name, locale);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_events_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_events_on_slug ON public.events USING btree (slug);


--
-- Name: index_events_on_starting_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_starting_at ON public.events USING btree (starting_at);


--
-- Name: index_pages_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_pages_on_slug ON public.pages USING btree (slug);


--
-- Name: index_presenters_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_presenters_on_name ON public.presenters USING btree (name);


--
-- Name: index_presenters_sessions_on_presenter_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_presenters_sessions_on_presenter_id ON public.presenters_sessions USING btree (presenter_id);


--
-- Name: index_presenters_sessions_on_session_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_presenters_sessions_on_session_id ON public.presenters_sessions USING btree (session_id);


--
-- Name: index_sessions_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sessions_on_event_id ON public.sessions USING btree (event_id);


--
-- Name: index_sessions_on_session_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sessions_on_session_type_id ON public.sessions USING btree (session_type_id);


--
-- Name: index_sessions_on_time_slot_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sessions_on_time_slot_id ON public.sessions USING btree (time_slot_id);


--
-- Name: index_sessions_time_slots_on_session_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sessions_time_slots_on_session_id ON public.sessions_time_slots USING btree (session_id);


--
-- Name: index_sessions_time_slots_on_session_id_and_time_slot_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_sessions_time_slots_on_session_id_and_time_slot_id ON public.sessions_time_slots USING btree (session_id, time_slot_id);


--
-- Name: index_sessions_time_slots_on_time_slot_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sessions_time_slots_on_time_slot_id ON public.sessions_time_slots USING btree (time_slot_id);


--
-- Name: index_time_slots_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_time_slots_on_event_id ON public.time_slots USING btree (event_id);


--
-- Name: index_time_slots_on_event_id_and_starting_at; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_time_slots_on_event_id_and_starting_at ON public.time_slots USING btree (event_id, starting_at);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: sessions fk_rails_31b34b204c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT fk_rails_31b34b204c FOREIGN KEY (session_type_id) REFERENCES public.session_types(id);


--
-- Name: time_slots fk_rails_787640e17f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.time_slots
    ADD CONSTRAINT fk_rails_787640e17f FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: sessions fk_rails_ad07c9070c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT fk_rails_ad07c9070c FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: sessions fk_rails_c514f60c63; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT fk_rails_c514f60c63 FOREIGN KEY (time_slot_id) REFERENCES public.time_slots(id);


--
-- PostgreSQL database dump complete
--

