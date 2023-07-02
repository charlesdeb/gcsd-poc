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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


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
    locale character varying DEFAULT 'en'::character varying NOT NULL,
    confirmation_token character varying,
    confirmed_at timestamp(6) with time zone,
    confirmation_sent_at timestamp(6) with time zone,
    unconfirmed_email character varying,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp(6) with time zone
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
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


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
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON public.users USING btree (unlock_token);


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

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20220524213358'),
('20220609220009'),
('20220612212512'),
('20220621221611'),
('20220623222815'),
('20220710210856'),
('20220711134553'),
('20220711134554'),
('20220711224005'),
('20220714203357'),
('20220715223802'),
('20220726060231'),
('20220828003626'),
('20220903213625'),
('20220919205829'),
('20221006221916'),
('20221121175153'),
('20221208155133'),
('20221212225301'),
('20221212231005'),
('20221217182852'),
('20221217220640'),
('20221217222307'),
('20221219223919'),
('20230122220645'),
('20230123171322'),
('20230123175037'),
('20230123204147'),
('20230129204853'),
('20230524131124'),
('20230525171238'),
('20230617171620'),
('20230617185222'),
('20230621204520'),
('20230702193959');


