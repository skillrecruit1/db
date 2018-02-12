--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: action_lists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE action_lists (
    id integer NOT NULL,
    action character varying(255),
    weight double precision,
    url character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE action_lists OWNER TO postgres;

--
-- Name: action_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE action_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE action_lists_id_seq OWNER TO postgres;

--
-- Name: action_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE action_lists_id_seq OWNED BY action_lists.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE addresses (
    id integer NOT NULL,
    line1 character varying(255),
    line2 character varying(255),
    city character varying(255),
    state character varying(255),
    pincode integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE addresses OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE addresses_id_seq OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: alert_channels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE alert_channels (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE alert_channels OWNER TO postgres;

--
-- Name: alert_channels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alert_channels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alert_channels_id_seq OWNER TO postgres;

--
-- Name: alert_channels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE alert_channels_id_seq OWNED BY alert_channels.id;


--
-- Name: alert_configs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE alert_configs (
    id integer NOT NULL,
    email text,
    sms text,
    business_app text,
    consumer_app text,
    alert_event_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_html boolean DEFAULT false
);


ALTER TABLE alert_configs OWNER TO postgres;

--
-- Name: alert_configs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alert_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alert_configs_id_seq OWNER TO postgres;

--
-- Name: alert_configs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE alert_configs_id_seq OWNED BY alert_configs.id;


--
-- Name: alert_event_channels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE alert_event_channels (
    id integer NOT NULL,
    is_active boolean,
    alert_event_id integer,
    alert_channel_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE alert_event_channels OWNER TO postgres;

--
-- Name: alert_event_channels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alert_event_channels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alert_event_channels_id_seq OWNER TO postgres;

--
-- Name: alert_event_channels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE alert_event_channels_id_seq OWNED BY alert_event_channels.id;


--
-- Name: alert_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE alert_events (
    id integer NOT NULL,
    name character varying(255),
    is_set_on boolean,
    user_id integer,
    company_id integer,
    alert_id integer,
    alert_type_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_default boolean
);


ALTER TABLE alert_events OWNER TO postgres;

--
-- Name: alert_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alert_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alert_events_id_seq OWNER TO postgres;

--
-- Name: alert_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE alert_events_id_seq OWNED BY alert_events.id;


--
-- Name: alert_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE alert_logs (
    id integer NOT NULL,
    event_params text,
    event_post_id character varying(255),
    is_viewed boolean,
    user_id integer,
    alert_event_id integer,
    alert_channel_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE alert_logs OWNER TO postgres;

--
-- Name: alert_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alert_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alert_logs_id_seq OWNER TO postgres;

--
-- Name: alert_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE alert_logs_id_seq OWNED BY alert_logs.id;


--
-- Name: alert_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE alert_types (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE alert_types OWNER TO postgres;

--
-- Name: alert_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alert_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alert_types_id_seq OWNER TO postgres;

--
-- Name: alert_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE alert_types_id_seq OWNED BY alert_types.id;


--
-- Name: alerts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE alerts (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE alerts OWNER TO postgres;

--
-- Name: alerts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alerts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alerts_id_seq OWNER TO postgres;

--
-- Name: alerts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE alerts_id_seq OWNED BY alerts.id;


--
-- Name: answer_analyses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE answer_analyses (
    id integer NOT NULL,
    answer_id integer NOT NULL,
    question_id integer NOT NULL,
    sentiment_score integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE answer_analyses OWNER TO postgres;

--
-- Name: answer_analyses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE answer_analyses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE answer_analyses_id_seq OWNER TO postgres;

--
-- Name: answer_analyses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE answer_analyses_id_seq OWNED BY answer_analyses.id;


--
-- Name: answer_options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE answer_options (
    id integer NOT NULL,
    question_id integer NOT NULL,
    options hstore NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE answer_options OWNER TO postgres;

--
-- Name: answer_options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE answer_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE answer_options_id_seq OWNER TO postgres;

--
-- Name: answer_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE answer_options_id_seq OWNED BY answer_options.id;


--
-- Name: answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE answers (
    id integer NOT NULL,
    customers_info_id integer,
    question_id integer,
    provider character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    comments character varying(255),
    free_text text,
    question_option_id integer,
    question_type_id integer,
    option character varying(255),
    date integer,
    month integer,
    year integer,
    hour integer,
    is_business_user boolean,
    is_deactivated boolean,
    is_other boolean DEFAULT false,
    uuid integer
);


ALTER TABLE answers OWNER TO postgres;

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE answers_id_seq OWNER TO postgres;

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE answers_id_seq OWNED BY answers.id;


--
-- Name: attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE attachments (
    id integer NOT NULL,
    image_file_name character varying(255),
    image_content_type character varying(255),
    image_file_size integer,
    image_updated_at timestamp without time zone,
    attachable_type character varying(255),
    attachable_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE attachments OWNER TO postgres;

--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attachments_id_seq OWNER TO postgres;

--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE attachments_id_seq OWNED BY attachments.id;


--
-- Name: backlog_email_lists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE backlog_email_lists (
    id integer NOT NULL,
    email_array text DEFAULT '{}'::character varying[],
    bitly_url character varying(255),
    subject text,
    message text,
    sender_email character varying(255),
    question_image character varying(255),
    ref_message_id character varying(255),
    status character varying(255),
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    email_type character varying(255),
    attach_path character varying(255),
    attach_type character varying(255),
    attach_name character varying(255),
    is_html boolean,
    question_id integer
);


ALTER TABLE backlog_email_lists OWNER TO postgres;

--
-- Name: backlog_email_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE backlog_email_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE backlog_email_lists_id_seq OWNER TO postgres;

--
-- Name: backlog_email_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE backlog_email_lists_id_seq OWNED BY backlog_email_lists.id;


--
-- Name: beacons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE beacons (
    id integer NOT NULL,
    name character varying(255),
    uid character varying(255),
    status boolean,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE beacons OWNER TO postgres;

--
-- Name: beacons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE beacons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE beacons_id_seq OWNER TO postgres;

--
-- Name: beacons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE beacons_id_seq OWNED BY beacons.id;


--
-- Name: billing_info_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE billing_info_details (
    id integer NOT NULL,
    user_id integer,
    billing_name character varying(255),
    billing_email character varying(255),
    billing_address character varying(255),
    billing_city character varying(255),
    billing_state character varying(255),
    billing_country character varying(255),
    billing_zip bigint,
    billing_phone character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE billing_info_details OWNER TO postgres;

--
-- Name: billing_info_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE billing_info_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE billing_info_details_id_seq OWNER TO postgres;

--
-- Name: billing_info_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE billing_info_details_id_seq OWNED BY billing_info_details.id;


--
-- Name: business_customer_infos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE business_customer_infos (
    id integer NOT NULL,
    mobile character varying(255),
    customer_name character varying(255),
    email character varying(255),
    response_status boolean,
    view_status boolean,
    gender character varying(255),
    question_id character varying(255),
    provider character varying(255),
    date_of_birth date,
    age integer,
    user_id integer,
    country character varying(255),
    state character varying(255),
    city character varying(255),
    area character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    cookie_token_id integer,
    is_deleted boolean,
    custom_field character varying(255),
    status character varying(255) DEFAULT false,
    consumer_id integer,
    is_active_consumer boolean
);


ALTER TABLE business_customer_infos OWNER TO postgres;

--
-- Name: business_customer_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE business_customer_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE business_customer_infos_id_seq OWNER TO postgres;

--
-- Name: business_customer_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE business_customer_infos_id_seq OWNED BY business_customer_infos.id;


--
-- Name: campaign_activity_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE campaign_activity_stats (
    id integer NOT NULL,
    post_id character varying(255),
    channel character varying(255),
    campaign_id integer,
    views integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    connections integer,
    reach integer,
    share_medium_id integer
);


ALTER TABLE campaign_activity_stats OWNER TO postgres;

--
-- Name: campaign_activity_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE campaign_activity_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE campaign_activity_stats_id_seq OWNER TO postgres;

--
-- Name: campaign_activity_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE campaign_activity_stats_id_seq OWNED BY campaign_activity_stats.id;


--
-- Name: campaign_channels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE campaign_channels (
    id integer NOT NULL,
    campaign_id integer,
    share_medium_id integer,
    user_channel_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    post_id character varying(255),
    connections integer,
    reach integer
);


ALTER TABLE campaign_channels OWNER TO postgres;

--
-- Name: campaign_channels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE campaign_channels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE campaign_channels_id_seq OWNER TO postgres;

--
-- Name: campaign_channels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE campaign_channels_id_seq OWNED BY campaign_channels.id;


--
-- Name: campaign_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE campaign_customers (
    id integer NOT NULL,
    campaign_channel_id integer,
    campaign_id integer,
    business_customer_info_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE campaign_customers OWNER TO postgres;

--
-- Name: campaign_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE campaign_customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE campaign_customers_id_seq OWNER TO postgres;

--
-- Name: campaign_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE campaign_customers_id_seq OWNED BY campaign_customers.id;


--
-- Name: campaign_customisations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE campaign_customisations (
    id integer NOT NULL,
    background character varying(255),
    question_text character varying(255),
    answer_text character varying(255),
    button_text character varying(255),
    button_background character varying(255),
    font_style_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE campaign_customisations OWNER TO postgres;

--
-- Name: campaign_customisations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE campaign_customisations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE campaign_customisations_id_seq OWNER TO postgres;

--
-- Name: campaign_customisations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE campaign_customisations_id_seq OWNED BY campaign_customisations.id;


--
-- Name: campaign_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE campaign_details (
    id integer NOT NULL,
    campaign_data text,
    campaign_short_urls text,
    campaign_id integer,
    share_medium_id integer,
    template_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE campaign_details OWNER TO postgres;

--
-- Name: campaign_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE campaign_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE campaign_details_id_seq OWNER TO postgres;

--
-- Name: campaign_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE campaign_details_id_seq OWNED BY campaign_details.id;


--
-- Name: campaign_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE campaign_types (
    id integer NOT NULL,
    campaign_type character varying(255),
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE campaign_types OWNER TO postgres;

--
-- Name: campaign_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE campaign_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE campaign_types_id_seq OWNER TO postgres;

--
-- Name: campaign_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE campaign_types_id_seq OWNED BY campaign_types.id;


--
-- Name: campaigns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE campaigns (
    id integer NOT NULL,
    label character varying(255),
    exp_date timestamp without time zone,
    campaign_end_url character varying(255),
    hash_tag character varying(255),
    media_url character varying(255),
    media_thumb_url character varying(255),
    two_way_campaign boolean,
    is_active boolean,
    is_embed_media boolean,
    schedule_on timestamp without time zone,
    user_id integer,
    campaign_type_id integer,
    share_medium_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    status character varying(255),
    is_archived boolean DEFAULT false,
    slug character varying(255),
    is_power_share boolean,
    campaign_uuid text,
    service_user_id integer,
    time_zone character varying(255)
);


ALTER TABLE campaigns OWNER TO postgres;

--
-- Name: campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE campaigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE campaigns_id_seq OWNER TO postgres;

--
-- Name: campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE campaigns_id_seq OWNED BY campaigns.id;


--
-- Name: category_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE category_types (
    id integer NOT NULL,
    category_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE category_types OWNER TO postgres;

--
-- Name: category_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE category_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_types_id_seq OWNER TO postgres;

--
-- Name: category_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE category_types_id_seq OWNED BY category_types.id;


--
-- Name: channels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE channels (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE channels OWNER TO postgres;

--
-- Name: channels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE channels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE channels_id_seq OWNER TO postgres;

--
-- Name: channels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE channels_id_seq OWNED BY channels.id;


--
-- Name: client_languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE client_languages (
    id integer NOT NULL,
    client_setting_id integer,
    language_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE client_languages OWNER TO postgres;

--
-- Name: client_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE client_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE client_languages_id_seq OWNER TO postgres;

--
-- Name: client_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE client_languages_id_seq OWNED BY client_languages.id;


--
-- Name: client_pricing_plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE client_pricing_plans (
    id integer NOT NULL,
    client_id integer,
    client_type character varying(255),
    email_count integer,
    sms_count integer,
    customer_records_count integer,
    campaigns_count integer,
    fb_boost_budget double precision,
    pricing_plan_id integer,
    is_active boolean,
    start_date timestamp without time zone,
    exp_date timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    total_reach integer
);


ALTER TABLE client_pricing_plans OWNER TO postgres;

--
-- Name: client_pricing_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE client_pricing_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE client_pricing_plans_id_seq OWNER TO postgres;

--
-- Name: client_pricing_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE client_pricing_plans_id_seq OWNED BY client_pricing_plans.id;


--
-- Name: client_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE client_settings (
    id integer NOT NULL,
    user_id integer NOT NULL,
    pricing_plan_id integer NOT NULL,
    tenant_count integer,
    customer_records_count integer,
    language_count integer,
    business_type_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    email_hourly_quota bigint,
    questions_count integer,
    video_photo_count integer,
    sms_count integer,
    call_count integer,
    email_count integer
);


ALTER TABLE client_settings OWNER TO postgres;

--
-- Name: client_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE client_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE client_settings_id_seq OWNER TO postgres;

--
-- Name: client_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE client_settings_id_seq OWNED BY client_settings.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE companies (
    id integer NOT NULL,
    name character varying(255),
    address character varying(255),
    area character varying(255),
    description text,
    company_type_id integer,
    industry_id integer,
    website_url character varying(255),
    facebook_url character varying(255),
    twitter_url character varying(255),
    linkedin_url character varying(255),
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    lat double precision,
    lng double precision,
    redirect_url character varying(255),
    piwik_id integer
);


ALTER TABLE companies OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE companies_id_seq OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE companies_id_seq OWNED BY companies.id;


--
-- Name: company_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE company_types (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE company_types OWNER TO postgres;

--
-- Name: company_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE company_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE company_types_id_seq OWNER TO postgres;

--
-- Name: company_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE company_types_id_seq OWNED BY company_types.id;


--
-- Name: contact_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE contact_groups (
    id integer NOT NULL,
    name character varying(255),
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE contact_groups OWNER TO postgres;

--
-- Name: contact_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contact_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contact_groups_id_seq OWNER TO postgres;

--
-- Name: contact_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contact_groups_id_seq OWNED BY contact_groups.id;


--
-- Name: cookie_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cookie_tokens (
    id integer NOT NULL,
    uuid character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE cookie_tokens OWNER TO postgres;

--
-- Name: cookie_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cookie_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cookie_tokens_id_seq OWNER TO postgres;

--
-- Name: cookie_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cookie_tokens_id_seq OWNED BY cookie_tokens.id;


--
-- Name: counts_stores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE counts_stores (
    id integer NOT NULL,
    question_id integer NOT NULL,
    vrtype character varying(255) NOT NULL,
    norm_date integer NOT NULL,
    country character varying(255),
    counts_key hstore DEFAULT '"f"=>"0", "m"=>"0", "fb"=>"0", "lk"=>"0", "qr"=>"0", "tw"=>"0", "sms"=>"0", "tkc"=>"0", "af00"=>"0", "af17"=>"0", "af25"=>"0", "af30"=>"0", "af35"=>"0", "af40"=>"0", "af45"=>"0", "af50"=>"0", "am00"=>"0", "am17"=>"0", "am25"=>"0", "am30"=>"0", "am35"=>"0", "am40"=>"0", "am45"=>"0", "am50"=>"0", "call"=>"0", "mail"=>"0", "embed"=>"0"'::hstore NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE counts_stores OWNER TO postgres;

--
-- Name: counts_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE counts_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE counts_stores_id_seq OWNER TO postgres;

--
-- Name: counts_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE counts_stores_id_seq OWNED BY counts_stores.id;


--
-- Name: cron_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cron_logs (
    id integer NOT NULL,
    last_run_id integer,
    log_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE cron_logs OWNER TO postgres;

--
-- Name: cron_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cron_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cron_logs_id_seq OWNER TO postgres;

--
-- Name: cron_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cron_logs_id_seq OWNED BY cron_logs.id;


--
-- Name: currencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE currencies (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE currencies OWNER TO postgres;

--
-- Name: currencies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE currencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE currencies_id_seq OWNER TO postgres;

--
-- Name: currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE currencies_id_seq OWNED BY currencies.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE customers (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255),
    salutation character varying(255),
    landline character varying(255),
    mobile character varying(255),
    address_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE customers OWNER TO postgres;

--
-- Name: customers_contact_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE customers_contact_groups (
    business_customer_info_id integer,
    contact_group_id integer
);


ALTER TABLE customers_contact_groups OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE customers_id_seq OWNED BY customers.id;


--
-- Name: delayed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE delayed_jobs (
    id integer NOT NULL,
    priority integer DEFAULT 0,
    attempts integer DEFAULT 0,
    handler text,
    last_error text,
    run_at timestamp without time zone,
    locked_at timestamp without time zone,
    failed_at timestamp without time zone,
    locked_by character varying(255),
    queue character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    campaign_id integer,
    user_id integer,
    share_now boolean
);


ALTER TABLE delayed_jobs OWNER TO postgres;

--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE delayed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delayed_jobs_id_seq OWNER TO postgres;

--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE delayed_jobs_id_seq OWNED BY delayed_jobs.id;


--
-- Name: delivery_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE delivery_types (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE delivery_types OWNER TO postgres;

--
-- Name: delivery_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE delivery_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delivery_types_id_seq OWNER TO postgres;

--
-- Name: delivery_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE delivery_types_id_seq OWNED BY delivery_types.id;


--
-- Name: devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE devices (
    id integer NOT NULL,
    device_id character varying(255),
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE devices OWNER TO postgres;

--
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE devices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE devices_id_seq OWNER TO postgres;

--
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE devices_id_seq OWNED BY devices.id;


--
-- Name: distribute_pricing_plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE distribute_pricing_plans (
    id integer NOT NULL,
    plan_name character varying(255) NOT NULL,
    form_builder boolean,
    offline_mode boolean,
    nrts_results boolean,
    surveys_count integer,
    responses_count integer,
    tell_the_world boolean,
    multilingual boolean,
    professional_template boolean,
    multitenant_structure boolean,
    download_reports boolean,
    sentiment_analysis boolean,
    media_content character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE distribute_pricing_plans OWNER TO postgres;

--
-- Name: distribute_pricing_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE distribute_pricing_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE distribute_pricing_plans_id_seq OWNER TO postgres;

--
-- Name: distribute_pricing_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE distribute_pricing_plans_id_seq OWNED BY distribute_pricing_plans.id;


--
-- Name: email_activities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE email_activities (
    id integer NOT NULL,
    opens integer,
    clicks integer,
    subject character varying(255),
    campaign_name character varying(255),
    question_id integer,
    user_id integer,
    business_customer_info_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE email_activities OWNER TO postgres;

--
-- Name: email_activities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE email_activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE email_activities_id_seq OWNER TO postgres;

--
-- Name: email_activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE email_activities_id_seq OWNED BY email_activities.id;


--
-- Name: enterprise_api_endpoints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE enterprise_api_endpoints (
    id integer NOT NULL,
    subdomain character varying(255),
    login_path character varying(255),
    logout_path character varying(255),
    forgot_pw_path character varying(255),
    change_pw_path character varying(255),
    user_id integer
);


ALTER TABLE enterprise_api_endpoints OWNER TO postgres;

--
-- Name: enterprise_api_endpoints_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enterprise_api_endpoints_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enterprise_api_endpoints_id_seq OWNER TO postgres;

--
-- Name: enterprise_api_endpoints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enterprise_api_endpoints_id_seq OWNED BY enterprise_api_endpoints.id;


--
-- Name: enterprise_contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE enterprise_contacts (
    id integer NOT NULL,
    name character varying(255),
    path character varying(255),
    enterprise_api_endpoint_id integer,
    tenant_can_access boolean,
    params text
);


ALTER TABLE enterprise_contacts OWNER TO postgres;

--
-- Name: enterprise_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enterprise_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enterprise_contacts_id_seq OWNER TO postgres;

--
-- Name: enterprise_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enterprise_contacts_id_seq OWNED BY enterprise_contacts.id;


--
-- Name: executive_business_mappings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE executive_business_mappings (
    id integer NOT NULL,
    user_id integer,
    company_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE executive_business_mappings OWNER TO postgres;

--
-- Name: executive_business_mappings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE executive_business_mappings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE executive_business_mappings_id_seq OWNER TO postgres;

--
-- Name: executive_business_mappings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE executive_business_mappings_id_seq OWNED BY executive_business_mappings.id;


--
-- Name: executive_tenant_mappings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE executive_tenant_mappings (
    id integer NOT NULL,
    user_id integer,
    tenant_id integer,
    client_id integer,
    is_active boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE executive_tenant_mappings OWNER TO postgres;

--
-- Name: executive_tenant_mappings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE executive_tenant_mappings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE executive_tenant_mappings_id_seq OWNER TO postgres;

--
-- Name: executive_tenant_mappings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE executive_tenant_mappings_id_seq OWNED BY executive_tenant_mappings.id;


--
-- Name: ezetap_configs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ezetap_configs (
    id integer NOT NULL,
    company_id integer,
    tenant_id integer,
    account_id character varying(255),
    charge_group_id character varying(255),
    app_key character varying(255),
    app_user_id character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE ezetap_configs OWNER TO postgres;

--
-- Name: ezetap_configs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ezetap_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ezetap_configs_id_seq OWNER TO postgres;

--
-- Name: ezetap_configs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ezetap_configs_id_seq OWNED BY ezetap_configs.id;


--
-- Name: features; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE features (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    controller_name character varying(255) NOT NULL,
    action_name character varying(255),
    title character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE features OWNER TO postgres;

--
-- Name: features_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE features_id_seq OWNER TO postgres;

--
-- Name: features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE features_id_seq OWNED BY features.id;


--
-- Name: font_styles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE font_styles (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE font_styles OWNER TO postgres;

--
-- Name: font_styles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE font_styles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE font_styles_id_seq OWNER TO postgres;

--
-- Name: font_styles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE font_styles_id_seq OWNED BY font_styles.id;


--
-- Name: funnel_marketing_states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funnel_marketing_states (
    id integer NOT NULL,
    action_name character varying(255),
    note text,
    appointment_at date,
    result character varying(255),
    funnel_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE funnel_marketing_states OWNER TO postgres;

--
-- Name: funnel_marketing_states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE funnel_marketing_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE funnel_marketing_states_id_seq OWNER TO postgres;

--
-- Name: funnel_marketing_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE funnel_marketing_states_id_seq OWNED BY funnel_marketing_states.id;


--
-- Name: funnel_sources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funnel_sources (
    id integer NOT NULL,
    name character varying(255),
    campaign_id integer,
    web_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE funnel_sources OWNER TO postgres;

--
-- Name: funnel_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE funnel_sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE funnel_sources_id_seq OWNER TO postgres;

--
-- Name: funnel_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE funnel_sources_id_seq OWNED BY funnel_sources.id;


--
-- Name: funnel_states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funnel_states (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE funnel_states OWNER TO postgres;

--
-- Name: funnel_states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE funnel_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE funnel_states_id_seq OWNER TO postgres;

--
-- Name: funnel_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE funnel_states_id_seq OWNED BY funnel_states.id;


--
-- Name: funnel_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funnel_types (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE funnel_types OWNER TO postgres;

--
-- Name: funnel_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE funnel_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE funnel_types_id_seq OWNER TO postgres;

--
-- Name: funnel_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE funnel_types_id_seq OWNED BY funnel_types.id;


--
-- Name: funnels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funnels (
    id integer NOT NULL,
    item_id integer,
    quantity integer,
    is_valid boolean,
    funnel_state_id integer,
    delivery_type_id integer,
    customer_id integer,
    company_id integer,
    spec_details json,
    tracking_id integer,
    payment_mode_id integer,
    funnel_source_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    funnel_type_id integer,
    campaign_id character varying(255),
    delivery_boy_id integer,
    rating integer,
    funnel_marketing_state_id integer,
    lead_title character varying(255),
    funnel_channel character varying(255)
);


ALTER TABLE funnels OWNER TO postgres;

--
-- Name: funnels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE funnels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE funnels_id_seq OWNER TO postgres;

--
-- Name: funnels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE funnels_id_seq OWNED BY funnels.id;


--
-- Name: industry_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE industry_tags (
    id integer NOT NULL,
    industry character varying(255),
    tag character varying(255),
    added_on timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE industry_tags OWNER TO postgres;

--
-- Name: industry_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE industry_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE industry_tags_id_seq OWNER TO postgres;

--
-- Name: industry_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE industry_tags_id_seq OWNED BY industry_tags.id;


--
-- Name: industry_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE industry_types (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE industry_types OWNER TO postgres;

--
-- Name: industry_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE industry_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE industry_types_id_seq OWNER TO postgres;

--
-- Name: industry_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE industry_types_id_seq OWNED BY industry_types.id;


--
-- Name: inq_campaigns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE inq_campaigns (
    id integer NOT NULL,
    uuid character varying(255),
    user_id integer,
    name character varying(255),
    state character varying(255),
    hash_tag character varying(255),
    campaign_type character varying(255),
    redirect_url text,
    campaign_url text,
    preview_data text,
    override_preview text,
    cards text,
    bitly_url text,
    valid_till timestamp without time zone,
    scheduled_on timestamp without time zone,
    added_on timestamp without time zone,
    inq_campaign_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE inq_campaigns OWNER TO postgres;

--
-- Name: inq_campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE inq_campaigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE inq_campaigns_id_seq OWNER TO postgres;

--
-- Name: inq_campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE inq_campaigns_id_seq OWNED BY inq_campaigns.id;


--
-- Name: invites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE invites (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    invite_code character varying(255),
    invite_expired_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE invites OWNER TO postgres;

--
-- Name: invites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE invites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE invites_id_seq OWNER TO postgres;

--
-- Name: invites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE invites_id_seq OWNED BY invites.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE items (
    id integer NOT NULL,
    name character varying(255),
    price double precision,
    is_active boolean,
    specs_id integer,
    company_id integer,
    image_url character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    sku_id character varying(255)
);


ALTER TABLE items OWNER TO postgres;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE items_id_seq OWNER TO postgres;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE items_id_seq OWNED BY items.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE languages (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE languages OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE languages_id_seq OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE languages_id_seq OWNED BY languages.id;


--
-- Name: linkedin_company_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE linkedin_company_pages (
    id integer NOT NULL,
    company_id integer,
    name character varying(255),
    company_logo character varying(255),
    user_social_channel_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE linkedin_company_pages OWNER TO postgres;

--
-- Name: linkedin_company_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE linkedin_company_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE linkedin_company_pages_id_seq OWNER TO postgres;

--
-- Name: linkedin_company_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE linkedin_company_pages_id_seq OWNED BY linkedin_company_pages.id;


--
-- Name: listeners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE listeners (
    id integer NOT NULL,
    client_id character varying(255),
    user_id integer,
    email character varying(255),
    username character varying(255),
    password character varying(255),
    status character varying(255),
    is_active boolean DEFAULT false,
    is_requested boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    company_name character varying(255)
);


ALTER TABLE listeners OWNER TO postgres;

--
-- Name: listeners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE listeners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE listeners_id_seq OWNER TO postgres;

--
-- Name: listeners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE listeners_id_seq OWNED BY listeners.id;


--
-- Name: payment_modes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE payment_modes (
    id integer NOT NULL,
    provider character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE payment_modes OWNER TO postgres;

--
-- Name: payment_modes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE payment_modes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE payment_modes_id_seq OWNER TO postgres;

--
-- Name: payment_modes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE payment_modes_id_seq OWNED BY payment_modes.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE permissions (
    id integer NOT NULL,
    role_id integer NOT NULL,
    access_level boolean NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    feature_id integer
);


ALTER TABLE permissions OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permissions_id_seq OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE permissions_id_seq OWNED BY permissions.id;


--
-- Name: pricing_category_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pricing_category_types (
    id integer NOT NULL,
    category_type_id integer,
    pricing_plan_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE pricing_category_types OWNER TO postgres;

--
-- Name: pricing_category_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pricing_category_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pricing_category_types_id_seq OWNER TO postgres;

--
-- Name: pricing_category_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pricing_category_types_id_seq OWNED BY pricing_category_types.id;


--
-- Name: pricing_plan_channels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pricing_plan_channels (
    plannable_id integer,
    channel_id integer,
    id integer,
    plannable_type character varying(255)
);


ALTER TABLE pricing_plan_channels OWNER TO postgres;

--
-- Name: pricing_plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pricing_plans (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    country character varying(255) DEFAULT 'IN'::character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    sms_count integer,
    email_count integer,
    amount double precision,
    campaigns_count integer,
    fb_boost_budget double precision,
    currency_id integer,
    is_default boolean,
    customer_records_count integer,
    total_reach integer,
    is_active boolean
);


ALTER TABLE pricing_plans OWNER TO postgres;

--
-- Name: pricing_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pricing_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pricing_plans_id_seq OWNER TO postgres;

--
-- Name: pricing_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pricing_plans_id_seq OWNED BY pricing_plans.id;


--
-- Name: qr_code_campaigns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE qr_code_campaigns (
    id integer NOT NULL,
    qr_code_id integer,
    campaign_id integer,
    campaign_short_url character varying(255),
    campaign_long_url character varying(255),
    is_scheduled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    campaign_slug character varying(255),
    is_active boolean
);


ALTER TABLE qr_code_campaigns OWNER TO postgres;

--
-- Name: qr_code_campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE qr_code_campaigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE qr_code_campaigns_id_seq OWNER TO postgres;

--
-- Name: qr_code_campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE qr_code_campaigns_id_seq OWNED BY qr_code_campaigns.id;


--
-- Name: qr_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE qr_codes (
    id integer NOT NULL,
    name character varying(255),
    short_url character varying(255),
    status boolean,
    is_default boolean,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    image_file_name character varying(255),
    image_content_type character varying(255),
    image_file_size integer,
    image_updated_at timestamp without time zone,
    slug character varying(255),
    url character varying(255),
    is_active boolean
);


ALTER TABLE qr_codes OWNER TO postgres;

--
-- Name: qr_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE qr_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE qr_codes_id_seq OWNER TO postgres;

--
-- Name: qr_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE qr_codes_id_seq OWNED BY qr_codes.id;


--
-- Name: question_options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE question_options (
    id integer NOT NULL,
    question_id integer,
    option character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "order" integer,
    is_other boolean,
    is_deactivated boolean
);


ALTER TABLE question_options OWNER TO postgres;

--
-- Name: question_options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE question_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE question_options_id_seq OWNER TO postgres;

--
-- Name: question_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE question_options_id_seq OWNED BY question_options.id;


--
-- Name: question_response_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE question_response_logs (
    id integer NOT NULL,
    question_id integer,
    provider character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer,
    cookie_token_id integer,
    is_processed boolean DEFAULT true,
    business_customer_info_id integer
);


ALTER TABLE question_response_logs OWNER TO postgres;

--
-- Name: question_response_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE question_response_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE question_response_logs_id_seq OWNER TO postgres;

--
-- Name: question_response_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE question_response_logs_id_seq OWNED BY question_response_logs.id;


--
-- Name: question_styles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE question_styles (
    id integer NOT NULL,
    question_id integer,
    background character varying(255),
    page_header character varying(255),
    submit_button character varying(255),
    question_text character varying(255),
    button_text character varying(255),
    answers character varying(255),
    font_style character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE question_styles OWNER TO postgres;

--
-- Name: question_styles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE question_styles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE question_styles_id_seq OWNER TO postgres;

--
-- Name: question_styles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE question_styles_id_seq OWNED BY question_styles.id;


--
-- Name: question_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE question_types (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE question_types OWNER TO postgres;

--
-- Name: question_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE question_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE question_types_id_seq OWNER TO postgres;

--
-- Name: question_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE question_types_id_seq OWNED BY question_types.id;


--
-- Name: question_view_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE question_view_logs (
    id integer NOT NULL,
    question_id integer,
    provider character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer,
    cookie_token_id integer,
    is_processed boolean DEFAULT true,
    business_customer_info_id integer
);


ALTER TABLE question_view_logs OWNER TO postgres;

--
-- Name: question_view_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE question_view_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE question_view_logs_id_seq OWNER TO postgres;

--
-- Name: question_view_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE question_view_logs_id_seq OWNED BY question_view_logs.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE questions (
    id integer NOT NULL,
    user_id integer,
    category_type_id integer,
    expiration_id character varying(255),
    question character varying(255),
    include_other boolean,
    include_text boolean,
    include_comment boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    status character varying(255) DEFAULT 'Inactive'::character varying,
    thanks_response text,
    expired_at timestamp without time zone,
    qrcode_status character varying(255),
    embed_url character varying(255),
    video_url character varying(255),
    question_type_id integer,
    video_type integer,
    slug character varying(255),
    language character varying(255) DEFAULT 'English'::character varying,
    private_access boolean DEFAULT false,
    short_url character varying(255),
    twitter_short_url character varying(255),
    linkedin_short_url character varying(255),
    qrcode_short_url character varying(255),
    sms_short_url character varying(255),
    view_count integer DEFAULT 0,
    response_count integer DEFAULT 0,
    video_url_thumb character varying(255),
    tenant_id integer,
    embed_status boolean DEFAULT false
);


ALTER TABLE questions OWNER TO postgres;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE questions_id_seq OWNER TO postgres;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE questions_id_seq OWNED BY questions.id;


--
-- Name: response_cookie_infos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE response_cookie_infos (
    id integer NOT NULL,
    response_token_id integer,
    response_token_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    cookie_token_id integer
);


ALTER TABLE response_cookie_infos OWNER TO postgres;

--
-- Name: response_cookie_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE response_cookie_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE response_cookie_infos_id_seq OWNER TO postgres;

--
-- Name: response_cookie_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE response_cookie_infos_id_seq OWNED BY response_cookie_infos.id;


--
-- Name: response_customer_infos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE response_customer_infos (
    id integer NOT NULL,
    mobile character varying(255),
    customer_name character varying(255),
    email character varying(255),
    response_status boolean,
    view_status boolean,
    gender character varying(255),
    question_id character varying(255),
    provider character varying(255),
    date_of_birth date,
    age integer,
    country character varying(255),
    state character varying(255),
    city character varying(255),
    area character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    cookie_token_id integer,
    user_id integer,
    is_deleted boolean
);


ALTER TABLE response_customer_infos OWNER TO postgres;

--
-- Name: response_customer_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE response_customer_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE response_customer_infos_id_seq OWNER TO postgres;

--
-- Name: response_customer_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE response_customer_infos_id_seq OWNED BY response_customer_infos.id;


--
-- Name: revisions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE revisions (
    id integer NOT NULL,
    content text,
    is_updated boolean,
    campaign_id integer,
    created_by integer,
    created_for integer,
    company_id integer,
    tenant_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE revisions OWNER TO postgres;

--
-- Name: revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE revisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE revisions_id_seq OWNER TO postgres;

--
-- Name: revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE revisions_id_seq OWNED BY revisions.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    profile text,
    visible_to_tenant boolean
);


ALTER TABLE roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: s3_configs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE s3_configs (
    id integer NOT NULL,
    identity_name text,
    identity_pool_name text,
    identity_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE s3_configs OWNER TO postgres;

--
-- Name: s3_configs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s3_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE s3_configs_id_seq OWNER TO postgres;

--
-- Name: s3_configs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE s3_configs_id_seq OWNED BY s3_configs.id;


--
-- Name: schedule_slots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE schedule_slots (
    id integer NOT NULL,
    slot character varying(255),
    schedule_type_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE schedule_slots OWNER TO postgres;

--
-- Name: schedule_slots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE schedule_slots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schedule_slots_id_seq OWNER TO postgres;

--
-- Name: schedule_slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE schedule_slots_id_seq OWNED BY schedule_slots.id;


--
-- Name: schedule_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE schedule_types (
    id integer NOT NULL,
    name character varying(255),
    is_active boolean,
    schedule_days text DEFAULT '---
MONDAY: true
TUESDAY: true
WEDNESDAY: true
THURSDAY: true
FRIDAY: true
SATURDAY: true
SUNDAY: true
'::text,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE schedule_types OWNER TO postgres;

--
-- Name: schedule_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE schedule_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schedule_types_id_seq OWNER TO postgres;

--
-- Name: schedule_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE schedule_types_id_seq OWNED BY schedule_types.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE schema_migrations OWNER TO postgres;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sessions (
    id integer NOT NULL,
    session_id character varying(255) NOT NULL,
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sessions_id_seq OWNED BY sessions.id;


--
-- Name: share_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE share_details (
    id integer NOT NULL,
    customer_records_count integer DEFAULT 0 NOT NULL,
    sms_count integer DEFAULT 0 NOT NULL,
    email_count integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    campaigns_count integer,
    fb_boost_budget double precision,
    is_current boolean,
    client_pricing_plan_id integer,
    total_reach integer
);


ALTER TABLE share_details OWNER TO postgres;

--
-- Name: share_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE share_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE share_details_id_seq OWNER TO postgres;

--
-- Name: share_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE share_details_id_seq OWNED BY share_details.id;


--
-- Name: share_mediums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE share_mediums (
    id integer NOT NULL,
    share_type character varying(255),
    is_active boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE share_mediums OWNER TO postgres;

--
-- Name: share_mediums_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE share_mediums_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE share_mediums_id_seq OWNER TO postgres;

--
-- Name: share_mediums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE share_mediums_id_seq OWNED BY share_mediums.id;


--
-- Name: share_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE share_questions (
    id integer NOT NULL,
    email_address character varying(255),
    provider character varying(255),
    social_id text,
    social_token text,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    active boolean DEFAULT false,
    user_name character varying(255),
    user_profile_image text
);


ALTER TABLE share_questions OWNER TO postgres;

--
-- Name: share_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE share_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE share_questions_id_seq OWNER TO postgres;

--
-- Name: share_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE share_questions_id_seq OWNED BY share_questions.id;


--
-- Name: share_summaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE share_summaries (
    id integer NOT NULL,
    customer_records_count integer DEFAULT 0 NOT NULL,
    sms_count integer DEFAULT 0 NOT NULL,
    email_count integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    fb_reach integer,
    campaign_id integer,
    share_detail_id integer
);


ALTER TABLE share_summaries OWNER TO postgres;

--
-- Name: share_summaries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE share_summaries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE share_summaries_id_seq OWNER TO postgres;

--
-- Name: share_summaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE share_summaries_id_seq OWNED BY share_summaries.id;


--
-- Name: specifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE specifications (
    id integer NOT NULL,
    attrs json,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE specifications OWNER TO postgres;

--
-- Name: specifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE specifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE specifications_id_seq OWNER TO postgres;

--
-- Name: specifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE specifications_id_seq OWNED BY specifications.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying(255),
    user_id integer,
    company_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE tags OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_id_seq OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: tenant_regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tenant_regions (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    user_id integer,
    is_active boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE tenant_regions OWNER TO postgres;

--
-- Name: tenant_regions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tenant_regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tenant_regions_id_seq OWNER TO postgres;

--
-- Name: tenant_regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tenant_regions_id_seq OWNED BY tenant_regions.id;


--
-- Name: tenant_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tenant_types (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    is_active boolean,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE tenant_types OWNER TO postgres;

--
-- Name: tenant_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tenant_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tenant_types_id_seq OWNER TO postgres;

--
-- Name: tenant_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tenant_types_id_seq OWNED BY tenant_types.id;


--
-- Name: tenants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tenants (
    id integer NOT NULL,
    name character varying(255),
    address character varying(255),
    client_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_active boolean DEFAULT true,
    redirect_url character varying(255),
    from_number character varying(255),
    lat double precision,
    lng double precision,
    phone character varying(255),
    contact_number character varying(255),
    email character varying(255),
    website_url character varying(255),
    facebook_url character varying(255),
    twitter_url character varying(255),
    linkedin_url character varying(255),
    logo_file_name character varying(255),
    logo_content_type character varying(255),
    logo_file_size integer,
    logo_updated_at timestamp without time zone,
    tenant_region_id integer,
    tenant_type_id integer,
    tenant_info text
);


ALTER TABLE tenants OWNER TO postgres;

--
-- Name: tenants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tenants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tenants_id_seq OWNER TO postgres;

--
-- Name: tenants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tenants_id_seq OWNED BY tenants.id;


--
-- Name: transaction_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transaction_details (
    id integer NOT NULL,
    user_id integer,
    pricing_plan_id integer,
    amount double precision,
    transaction_id character varying(255),
    profile_id character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    expiry_date timestamp without time zone,
    order_id character varying(255),
    active boolean DEFAULT false,
    action character varying(255),
    payment_status character varying(255),
    zaakpay_response text,
    response_dec character varying(255),
    response_code integer,
    tracking_id character varying(255),
    bank_ref_no character varying(255),
    failure_message character varying(255),
    payment_mode character varying(255),
    card_name character varying(255),
    status_code integer,
    status_message character varying(255),
    currency character varying(255),
    request_plan_id integer
);


ALTER TABLE transaction_details OWNER TO postgres;

--
-- Name: transaction_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transaction_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transaction_details_id_seq OWNER TO postgres;

--
-- Name: transaction_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transaction_details_id_seq OWNED BY transaction_details.id;


--
-- Name: user_action_lists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_action_lists (
    id integer NOT NULL,
    completed boolean,
    user_id integer,
    action_list_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE user_action_lists OWNER TO postgres;

--
-- Name: user_action_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_action_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_action_lists_id_seq OWNER TO postgres;

--
-- Name: user_action_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_action_lists_id_seq OWNED BY user_action_lists.id;


--
-- Name: user_channels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_channels (
    id integer NOT NULL,
    channel_type text,
    channel_id integer,
    share_medium_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE user_channels OWNER TO postgres;

--
-- Name: user_channels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_channels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_channels_id_seq OWNER TO postgres;

--
-- Name: user_channels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_channels_id_seq OWNED BY user_channels.id;


--
-- Name: user_configs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_configs (
    id integer NOT NULL,
    engage text,
    listen text,
    others text,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE user_configs OWNER TO postgres;

--
-- Name: user_configs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_configs_id_seq OWNER TO postgres;

--
-- Name: user_configs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_configs_id_seq OWNED BY user_configs.id;


--
-- Name: user_invites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_invites (
    id integer NOT NULL,
    email character varying(255),
    user_id integer,
    is_onboarded boolean
);


ALTER TABLE user_invites OWNER TO postgres;

--
-- Name: user_invites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_invites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_invites_id_seq OWNER TO postgres;

--
-- Name: user_invites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_invites_id_seq OWNED BY user_invites.id;


--
-- Name: user_location_channels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_location_channels (
    id integer NOT NULL,
    channel_id integer,
    channel_type character varying(255),
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE user_location_channels OWNER TO postgres;

--
-- Name: user_location_channels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_location_channels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_location_channels_id_seq OWNER TO postgres;

--
-- Name: user_location_channels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_location_channels_id_seq OWNED BY user_location_channels.id;


--
-- Name: user_mobile_channels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_mobile_channels (
    id integer NOT NULL,
    channel character varying(255),
    contact_group_id integer,
    user_id integer,
    active boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE user_mobile_channels OWNER TO postgres;

--
-- Name: user_mobile_channels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_mobile_channels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_mobile_channels_id_seq OWNER TO postgres;

--
-- Name: user_mobile_channels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_mobile_channels_id_seq OWNED BY user_mobile_channels.id;


--
-- Name: user_social_channels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_social_channels (
    id integer NOT NULL,
    channel character varying(255),
    social_id text,
    social_token text,
    email character varying(255),
    name text,
    profile_image text,
    user_id integer,
    active boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    connections integer,
    valid_oauth boolean,
    is_page boolean,
    admin_id integer
);


ALTER TABLE user_social_channels OWNER TO postgres;

--
-- Name: user_social_channels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_social_channels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_social_channels_id_seq OWNER TO postgres;

--
-- Name: user_social_channels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_social_channels_id_seq OWNED BY user_social_channels.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    confirmation_token character varying(255),
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying(255),
    authentication_token character varying(255),
    uid text,
    parent_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    admin boolean DEFAULT false,
    subscribe boolean DEFAULT false,
    exp_date timestamp without time zone,
    is_active boolean,
    failed_attempts integer,
    unlock_token character varying(255),
    locked_at timestamp without time zone,
    role_id integer,
    tenant_id integer,
    is_csv_processed boolean DEFAULT true,
    security_token character varying(255),
    avatar_file_name character varying(255),
    avatar_content_type character varying(255),
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    avatar_url character varying(255),
    mobile character varying(255),
    currency_id integer,
    invite_code character varying(255)
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: action_lists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY action_lists ALTER COLUMN id SET DEFAULT nextval('action_lists_id_seq'::regclass);


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: alert_channels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alert_channels ALTER COLUMN id SET DEFAULT nextval('alert_channels_id_seq'::regclass);


--
-- Name: alert_configs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alert_configs ALTER COLUMN id SET DEFAULT nextval('alert_configs_id_seq'::regclass);


--
-- Name: alert_event_channels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alert_event_channels ALTER COLUMN id SET DEFAULT nextval('alert_event_channels_id_seq'::regclass);


--
-- Name: alert_events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alert_events ALTER COLUMN id SET DEFAULT nextval('alert_events_id_seq'::regclass);


--
-- Name: alert_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alert_logs ALTER COLUMN id SET DEFAULT nextval('alert_logs_id_seq'::regclass);


--
-- Name: alert_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alert_types ALTER COLUMN id SET DEFAULT nextval('alert_types_id_seq'::regclass);


--
-- Name: alerts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alerts ALTER COLUMN id SET DEFAULT nextval('alerts_id_seq'::regclass);


--
-- Name: answer_analyses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY answer_analyses ALTER COLUMN id SET DEFAULT nextval('answer_analyses_id_seq'::regclass);


--
-- Name: answer_options id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY answer_options ALTER COLUMN id SET DEFAULT nextval('answer_options_id_seq'::regclass);


--
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY answers ALTER COLUMN id SET DEFAULT nextval('answers_id_seq'::regclass);


--
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attachments ALTER COLUMN id SET DEFAULT nextval('attachments_id_seq'::regclass);


--
-- Name: backlog_email_lists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY backlog_email_lists ALTER COLUMN id SET DEFAULT nextval('backlog_email_lists_id_seq'::regclass);


--
-- Name: beacons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY beacons ALTER COLUMN id SET DEFAULT nextval('beacons_id_seq'::regclass);


--
-- Name: billing_info_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY billing_info_details ALTER COLUMN id SET DEFAULT nextval('billing_info_details_id_seq'::regclass);


--
-- Name: business_customer_infos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY business_customer_infos ALTER COLUMN id SET DEFAULT nextval('business_customer_infos_id_seq'::regclass);


--
-- Name: campaign_activity_stats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY campaign_activity_stats ALTER COLUMN id SET DEFAULT nextval('campaign_activity_stats_id_seq'::regclass);


--
-- Name: campaign_channels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY campaign_channels ALTER COLUMN id SET DEFAULT nextval('campaign_channels_id_seq'::regclass);


--
-- Name: campaign_customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY campaign_customers ALTER COLUMN id SET DEFAULT nextval('campaign_customers_id_seq'::regclass);


--
-- Name: campaign_customisations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY campaign_customisations ALTER COLUMN id SET DEFAULT nextval('campaign_customisations_id_seq'::regclass);


--
-- Name: campaign_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY campaign_details ALTER COLUMN id SET DEFAULT nextval('campaign_details_id_seq'::regclass);


--
-- Name: campaign_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY campaign_types ALTER COLUMN id SET DEFAULT nextval('campaign_types_id_seq'::regclass);


--
-- Name: campaigns id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY campaigns ALTER COLUMN id SET DEFAULT nextval('campaigns_id_seq'::regclass);


--
-- Name: category_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category_types ALTER COLUMN id SET DEFAULT nextval('category_types_id_seq'::regclass);


--
-- Name: channels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY channels ALTER COLUMN id SET DEFAULT nextval('channels_id_seq'::regclass);


--
-- Name: client_languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY client_languages ALTER COLUMN id SET DEFAULT nextval('client_languages_id_seq'::regclass);


--
-- Name: client_pricing_plans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY client_pricing_plans ALTER COLUMN id SET DEFAULT nextval('client_pricing_plans_id_seq'::regclass);


--
-- Name: client_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY client_settings ALTER COLUMN id SET DEFAULT nextval('client_settings_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY companies ALTER COLUMN id SET DEFAULT nextval('companies_id_seq'::regclass);


--
-- Name: company_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY company_types ALTER COLUMN id SET DEFAULT nextval('company_types_id_seq'::regclass);


--
-- Name: contact_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contact_groups ALTER COLUMN id SET DEFAULT nextval('contact_groups_id_seq'::regclass);


--
-- Name: cookie_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cookie_tokens ALTER COLUMN id SET DEFAULT nextval('cookie_tokens_id_seq'::regclass);


--
-- Name: counts_stores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY counts_stores ALTER COLUMN id SET DEFAULT nextval('counts_stores_id_seq'::regclass);


--
-- Name: cron_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cron_logs ALTER COLUMN id SET DEFAULT nextval('cron_logs_id_seq'::regclass);


--
-- Name: currencies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY currencies ALTER COLUMN id SET DEFAULT nextval('currencies_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- Name: delayed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY delayed_jobs ALTER COLUMN id SET DEFAULT nextval('delayed_jobs_id_seq'::regclass);


--
-- Name: delivery_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY delivery_types ALTER COLUMN id SET DEFAULT nextval('delivery_types_id_seq'::regclass);


--
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY devices ALTER COLUMN id SET DEFAULT nextval('devices_id_seq'::regclass);


--
-- Name: distribute_pricing_plans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY distribute_pricing_plans ALTER COLUMN id SET DEFAULT nextval('distribute_pricing_plans_id_seq'::regclass);


--
-- Name: email_activities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY email_activities ALTER COLUMN id SET DEFAULT nextval('email_activities_id_seq'::regclass);


--
-- Name: enterprise_api_endpoints id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enterprise_api_endpoints ALTER COLUMN id SET DEFAULT nextval('enterprise_api_endpoints_id_seq'::regclass);


--
-- Name: enterprise_contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enterprise_contacts ALTER COLUMN id SET DEFAULT nextval('enterprise_contacts_id_seq'::regclass);


--
-- Name: executive_business_mappings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY executive_business_mappings ALTER COLUMN id SET DEFAULT nextval('executive_business_mappings_id_seq'::regclass);


--
-- Name: executive_tenant_mappings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY executive_tenant_mappings ALTER COLUMN id SET DEFAULT nextval('executive_tenant_mappings_id_seq'::regclass);


--
-- Name: ezetap_configs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ezetap_configs ALTER COLUMN id SET DEFAULT nextval('ezetap_configs_id_seq'::regclass);


--
-- Name: features id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY features ALTER COLUMN id SET DEFAULT nextval('features_id_seq'::regclass);


--
-- Name: font_styles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY font_styles ALTER COLUMN id SET DEFAULT nextval('font_styles_id_seq'::regclass);


--
-- Name: funnel_marketing_states id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funnel_marketing_states ALTER COLUMN id SET DEFAULT nextval('funnel_marketing_states_id_seq'::regclass);


--
-- Name: funnel_sources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funnel_sources ALTER COLUMN id SET DEFAULT nextval('funnel_sources_id_seq'::regclass);


--
-- Name: funnel_states id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funnel_states ALTER COLUMN id SET DEFAULT nextval('funnel_states_id_seq'::regclass);


--
-- Name: funnel_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funnel_types ALTER COLUMN id SET DEFAULT nextval('funnel_types_id_seq'::regclass);


--
-- Name: funnels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funnels ALTER COLUMN id SET DEFAULT nextval('funnels_id_seq'::regclass);


--
-- Name: industry_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY industry_tags ALTER COLUMN id SET DEFAULT nextval('industry_tags_id_seq'::regclass);


--
-- Name: industry_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY industry_types ALTER COLUMN id SET DEFAULT nextval('industry_types_id_seq'::regclass);


--
-- Name: inq_campaigns id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inq_campaigns ALTER COLUMN id SET DEFAULT nextval('inq_campaigns_id_seq'::regclass);


--
-- Name: invites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY invites ALTER COLUMN id SET DEFAULT nextval('invites_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY items ALTER COLUMN id SET DEFAULT nextval('items_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY languages ALTER COLUMN id SET DEFAULT nextval('languages_id_seq'::regclass);


--
-- Name: linkedin_company_pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY linkedin_company_pages ALTER COLUMN id SET DEFAULT nextval('linkedin_company_pages_id_seq'::regclass);


--
-- Name: listeners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY listeners ALTER COLUMN id SET DEFAULT nextval('listeners_id_seq'::regclass);


--
-- Name: payment_modes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payment_modes ALTER COLUMN id SET DEFAULT nextval('payment_modes_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permissions ALTER COLUMN id SET DEFAULT nextval('permissions_id_seq'::regclass);


--
-- Name: pricing_category_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pricing_category_types ALTER COLUMN id SET DEFAULT nextval('pricing_category_types_id_seq'::regclass);


--
-- Name: pricing_plans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pricing_plans ALTER COLUMN id SET DEFAULT nextval('pricing_plans_id_seq'::regclass);


--
-- Name: qr_code_campaigns id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY qr_code_campaigns ALTER COLUMN id SET DEFAULT nextval('qr_code_campaigns_id_seq'::regclass);


--
-- Name: qr_codes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY qr_codes ALTER COLUMN id SET DEFAULT nextval('qr_codes_id_seq'::regclass);


--
-- Name: question_options id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_options ALTER COLUMN id SET DEFAULT nextval('question_options_id_seq'::regclass);


--
-- Name: question_response_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_response_logs ALTER COLUMN id SET DEFAULT nextval('question_response_logs_id_seq'::regclass);


--
-- Name: question_styles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_styles ALTER COLUMN id SET DEFAULT nextval('question_styles_id_seq'::regclass);


--
-- Name: question_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_types ALTER COLUMN id SET DEFAULT nextval('question_types_id_seq'::regclass);


--
-- Name: question_view_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_view_logs ALTER COLUMN id SET DEFAULT nextval('question_view_logs_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY questions ALTER COLUMN id SET DEFAULT nextval('questions_id_seq'::regclass);


--
-- Name: response_cookie_infos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY response_cookie_infos ALTER COLUMN id SET DEFAULT nextval('response_cookie_infos_id_seq'::regclass);


--
-- Name: response_customer_infos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY response_customer_infos ALTER COLUMN id SET DEFAULT nextval('response_customer_infos_id_seq'::regclass);


--
-- Name: revisions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY revisions ALTER COLUMN id SET DEFAULT nextval('revisions_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: s3_configs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY s3_configs ALTER COLUMN id SET DEFAULT nextval('s3_configs_id_seq'::regclass);


--
-- Name: schedule_slots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedule_slots ALTER COLUMN id SET DEFAULT nextval('schedule_slots_id_seq'::regclass);


--
-- Name: schedule_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedule_types ALTER COLUMN id SET DEFAULT nextval('schedule_types_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessions ALTER COLUMN id SET DEFAULT nextval('sessions_id_seq'::regclass);


--
-- Name: share_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY share_details ALTER COLUMN id SET DEFAULT nextval('share_details_id_seq'::regclass);


--
-- Name: share_mediums id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY share_mediums ALTER COLUMN id SET DEFAULT nextval('share_mediums_id_seq'::regclass);


--
-- Name: share_questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY share_questions ALTER COLUMN id SET DEFAULT nextval('share_questions_id_seq'::regclass);


--
-- Name: share_summaries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY share_summaries ALTER COLUMN id SET DEFAULT nextval('share_summaries_id_seq'::regclass);


--
-- Name: specifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specifications ALTER COLUMN id SET DEFAULT nextval('specifications_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: tenant_regions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tenant_regions ALTER COLUMN id SET DEFAULT nextval('tenant_regions_id_seq'::regclass);


--
-- Name: tenant_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tenant_types ALTER COLUMN id SET DEFAULT nextval('tenant_types_id_seq'::regclass);


--
-- Name: tenants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tenants ALTER COLUMN id SET DEFAULT nextval('tenants_id_seq'::regclass);


--
-- Name: transaction_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transaction_details ALTER COLUMN id SET DEFAULT nextval('transaction_details_id_seq'::regclass);


--
-- Name: user_action_lists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_action_lists ALTER COLUMN id SET DEFAULT nextval('user_action_lists_id_seq'::regclass);


--
-- Name: user_channels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_channels ALTER COLUMN id SET DEFAULT nextval('user_channels_id_seq'::regclass);


--
-- Name: user_configs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_configs ALTER COLUMN id SET DEFAULT nextval('user_configs_id_seq'::regclass);


--
-- Name: user_invites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_invites ALTER COLUMN id SET DEFAULT nextval('user_invites_id_seq'::regclass);


--
-- Name: user_location_channels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_location_channels ALTER COLUMN id SET DEFAULT nextval('user_location_channels_id_seq'::regclass);


--
-- Name: user_mobile_channels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_mobile_channels ALTER COLUMN id SET DEFAULT nextval('user_mobile_channels_id_seq'::regclass);


--
-- Name: user_social_channels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_social_channels ALTER COLUMN id SET DEFAULT nextval('user_social_channels_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: action_lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY action_lists (id, action, weight, url, created_at, updated_at) FROM stdin;
\.


--
-- Name: action_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('action_lists_id_seq', 1, false);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY addresses (id, line1, line2, city, state, pincode, created_at, updated_at) FROM stdin;
\.


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('addresses_id_seq', 1, false);


--
-- Data for Name: alert_channels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alert_channels (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: alert_channels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('alert_channels_id_seq', 1, false);


--
-- Data for Name: alert_configs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alert_configs (id, email, sms, business_app, consumer_app, alert_event_id, created_at, updated_at, is_html) FROM stdin;
\.


--
-- Name: alert_configs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('alert_configs_id_seq', 1, false);


--
-- Data for Name: alert_event_channels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alert_event_channels (id, is_active, alert_event_id, alert_channel_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: alert_event_channels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('alert_event_channels_id_seq', 1, false);


--
-- Data for Name: alert_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alert_events (id, name, is_set_on, user_id, company_id, alert_id, alert_type_id, created_at, updated_at, is_default) FROM stdin;
\.


--
-- Name: alert_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('alert_events_id_seq', 1, false);


--
-- Data for Name: alert_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alert_logs (id, event_params, event_post_id, is_viewed, user_id, alert_event_id, alert_channel_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: alert_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('alert_logs_id_seq', 1, false);


--
-- Data for Name: alert_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alert_types (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: alert_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('alert_types_id_seq', 1, false);


--
-- Data for Name: alerts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alerts (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: alerts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('alerts_id_seq', 1, false);


--
-- Data for Name: answer_analyses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY answer_analyses (id, answer_id, question_id, sentiment_score, created_at, updated_at) FROM stdin;
\.


--
-- Name: answer_analyses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('answer_analyses_id_seq', 1, false);


--
-- Data for Name: answer_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY answer_options (id, question_id, options, created_at, updated_at) FROM stdin;
\.


--
-- Name: answer_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('answer_options_id_seq', 1, false);


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY answers (id, customers_info_id, question_id, provider, created_at, updated_at, comments, free_text, question_option_id, question_type_id, option, date, month, year, hour, is_business_user, is_deactivated, is_other, uuid) FROM stdin;
\.


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('answers_id_seq', 1, false);


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY attachments (id, image_file_name, image_content_type, image_file_size, image_updated_at, attachable_type, attachable_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('attachments_id_seq', 1, false);


--
-- Data for Name: backlog_email_lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY backlog_email_lists (id, email_array, bitly_url, subject, message, sender_email, question_image, ref_message_id, status, user_id, created_at, updated_at, email_type, attach_path, attach_type, attach_name, is_html, question_id) FROM stdin;
\.


--
-- Name: backlog_email_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('backlog_email_lists_id_seq', 1, false);


--
-- Data for Name: beacons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY beacons (id, name, uid, status, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: beacons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('beacons_id_seq', 1, false);


--
-- Data for Name: billing_info_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY billing_info_details (id, user_id, billing_name, billing_email, billing_address, billing_city, billing_state, billing_country, billing_zip, billing_phone, created_at, updated_at) FROM stdin;
\.


--
-- Name: billing_info_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('billing_info_details_id_seq', 1, false);


--
-- Data for Name: business_customer_infos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY business_customer_infos (id, mobile, customer_name, email, response_status, view_status, gender, question_id, provider, date_of_birth, age, user_id, country, state, city, area, created_at, updated_at, cookie_token_id, is_deleted, custom_field, status, consumer_id, is_active_consumer) FROM stdin;
\.


--
-- Name: business_customer_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('business_customer_infos_id_seq', 1, false);


--
-- Data for Name: campaign_activity_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY campaign_activity_stats (id, post_id, channel, campaign_id, views, created_at, updated_at, connections, reach, share_medium_id) FROM stdin;
\.


--
-- Name: campaign_activity_stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('campaign_activity_stats_id_seq', 1, false);


--
-- Data for Name: campaign_channels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY campaign_channels (id, campaign_id, share_medium_id, user_channel_id, created_at, updated_at, post_id, connections, reach) FROM stdin;
\.


--
-- Name: campaign_channels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('campaign_channels_id_seq', 1, false);


--
-- Data for Name: campaign_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY campaign_customers (id, campaign_channel_id, campaign_id, business_customer_info_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: campaign_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('campaign_customers_id_seq', 1, false);


--
-- Data for Name: campaign_customisations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY campaign_customisations (id, background, question_text, answer_text, button_text, button_background, font_style_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: campaign_customisations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('campaign_customisations_id_seq', 1, false);


--
-- Data for Name: campaign_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY campaign_details (id, campaign_data, campaign_short_urls, campaign_id, share_medium_id, template_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: campaign_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('campaign_details_id_seq', 1, false);


--
-- Data for Name: campaign_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY campaign_types (id, campaign_type, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: campaign_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('campaign_types_id_seq', 1, false);


--
-- Data for Name: campaigns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY campaigns (id, label, exp_date, campaign_end_url, hash_tag, media_url, media_thumb_url, two_way_campaign, is_active, is_embed_media, schedule_on, user_id, campaign_type_id, share_medium_id, created_at, updated_at, status, is_archived, slug, is_power_share, campaign_uuid, service_user_id, time_zone) FROM stdin;
\.


--
-- Name: campaigns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('campaigns_id_seq', 1, false);


--
-- Data for Name: category_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY category_types (id, category_name, created_at, updated_at) FROM stdin;
\.


--
-- Name: category_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('category_types_id_seq', 1, false);


--
-- Data for Name: channels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY channels (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: channels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('channels_id_seq', 1, false);


--
-- Data for Name: client_languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY client_languages (id, client_setting_id, language_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: client_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('client_languages_id_seq', 1, false);


--
-- Data for Name: client_pricing_plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY client_pricing_plans (id, client_id, client_type, email_count, sms_count, customer_records_count, campaigns_count, fb_boost_budget, pricing_plan_id, is_active, start_date, exp_date, created_at, updated_at, total_reach) FROM stdin;
\.


--
-- Name: client_pricing_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('client_pricing_plans_id_seq', 1, false);


--
-- Data for Name: client_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY client_settings (id, user_id, pricing_plan_id, tenant_count, customer_records_count, language_count, business_type_id, created_at, updated_at, email_hourly_quota, questions_count, video_photo_count, sms_count, call_count, email_count) FROM stdin;
\.


--
-- Name: client_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('client_settings_id_seq', 1, false);


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY companies (id, name, address, area, description, company_type_id, industry_id, website_url, facebook_url, twitter_url, linkedin_url, user_id, created_at, updated_at, lat, lng, redirect_url, piwik_id) FROM stdin;
\.


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('companies_id_seq', 1, false);


--
-- Data for Name: company_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY company_types (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: company_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('company_types_id_seq', 1, false);


--
-- Data for Name: contact_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contact_groups (id, name, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: contact_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contact_groups_id_seq', 1, false);


--
-- Data for Name: cookie_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cookie_tokens (id, uuid, created_at, updated_at) FROM stdin;
\.


--
-- Name: cookie_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cookie_tokens_id_seq', 1, false);


--
-- Data for Name: counts_stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY counts_stores (id, question_id, vrtype, norm_date, country, counts_key, created_at, updated_at) FROM stdin;
\.


--
-- Name: counts_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('counts_stores_id_seq', 1, false);


--
-- Data for Name: cron_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cron_logs (id, last_run_id, log_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: cron_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cron_logs_id_seq', 1, false);


--
-- Data for Name: currencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY currencies (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('currencies_id_seq', 1, false);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customers (id, first_name, last_name, email, salutation, landline, mobile, address_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: customers_contact_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customers_contact_groups (business_customer_info_id, contact_group_id) FROM stdin;
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('customers_id_seq', 1, false);


--
-- Data for Name: delayed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY delayed_jobs (id, priority, attempts, handler, last_error, run_at, locked_at, failed_at, locked_by, queue, created_at, updated_at, campaign_id, user_id, share_now) FROM stdin;
\.


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('delayed_jobs_id_seq', 1, false);


--
-- Data for Name: delivery_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY delivery_types (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: delivery_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('delivery_types_id_seq', 1, false);


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY devices (id, device_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('devices_id_seq', 1, false);


--
-- Data for Name: distribute_pricing_plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY distribute_pricing_plans (id, plan_name, form_builder, offline_mode, nrts_results, surveys_count, responses_count, tell_the_world, multilingual, professional_template, multitenant_structure, download_reports, sentiment_analysis, media_content, created_at, updated_at) FROM stdin;
\.


--
-- Name: distribute_pricing_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('distribute_pricing_plans_id_seq', 1, false);


--
-- Data for Name: email_activities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY email_activities (id, opens, clicks, subject, campaign_name, question_id, user_id, business_customer_info_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: email_activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('email_activities_id_seq', 1, false);


--
-- Data for Name: enterprise_api_endpoints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY enterprise_api_endpoints (id, subdomain, login_path, logout_path, forgot_pw_path, change_pw_path, user_id) FROM stdin;
\.


--
-- Name: enterprise_api_endpoints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enterprise_api_endpoints_id_seq', 1, false);


--
-- Data for Name: enterprise_contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY enterprise_contacts (id, name, path, enterprise_api_endpoint_id, tenant_can_access, params) FROM stdin;
\.


--
-- Name: enterprise_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enterprise_contacts_id_seq', 1, false);


--
-- Data for Name: executive_business_mappings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY executive_business_mappings (id, user_id, company_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: executive_business_mappings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('executive_business_mappings_id_seq', 1, false);


--
-- Data for Name: executive_tenant_mappings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY executive_tenant_mappings (id, user_id, tenant_id, client_id, is_active, created_at, updated_at) FROM stdin;
\.


--
-- Name: executive_tenant_mappings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('executive_tenant_mappings_id_seq', 1, false);


--
-- Data for Name: ezetap_configs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ezetap_configs (id, company_id, tenant_id, account_id, charge_group_id, app_key, app_user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: ezetap_configs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ezetap_configs_id_seq', 1, false);


--
-- Data for Name: features; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY features (id, parent_id, controller_name, action_name, title, created_at, updated_at) FROM stdin;
\.


--
-- Name: features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('features_id_seq', 1, false);


--
-- Data for Name: font_styles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY font_styles (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: font_styles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('font_styles_id_seq', 1, false);


--
-- Data for Name: funnel_marketing_states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY funnel_marketing_states (id, action_name, note, appointment_at, result, funnel_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: funnel_marketing_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('funnel_marketing_states_id_seq', 1, false);


--
-- Data for Name: funnel_sources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY funnel_sources (id, name, campaign_id, web_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: funnel_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('funnel_sources_id_seq', 1, false);


--
-- Data for Name: funnel_states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY funnel_states (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: funnel_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('funnel_states_id_seq', 1, false);


--
-- Data for Name: funnel_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY funnel_types (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: funnel_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('funnel_types_id_seq', 1, false);


--
-- Data for Name: funnels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY funnels (id, item_id, quantity, is_valid, funnel_state_id, delivery_type_id, customer_id, company_id, spec_details, tracking_id, payment_mode_id, funnel_source_id, created_at, updated_at, funnel_type_id, campaign_id, delivery_boy_id, rating, funnel_marketing_state_id, lead_title, funnel_channel) FROM stdin;
\.


--
-- Name: funnels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('funnels_id_seq', 1, false);


--
-- Data for Name: industry_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY industry_tags (id, industry, tag, added_on, created_at, updated_at) FROM stdin;
\.


--
-- Name: industry_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('industry_tags_id_seq', 1, false);


--
-- Data for Name: industry_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY industry_types (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: industry_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('industry_types_id_seq', 1, false);


--
-- Data for Name: inq_campaigns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY inq_campaigns (id, uuid, user_id, name, state, hash_tag, campaign_type, redirect_url, campaign_url, preview_data, override_preview, cards, bitly_url, valid_till, scheduled_on, added_on, inq_campaign_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: inq_campaigns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('inq_campaigns_id_seq', 1, false);


--
-- Data for Name: invites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY invites (id, name, email, invite_code, invite_expired_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: invites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('invites_id_seq', 1, false);


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY items (id, name, price, is_active, specs_id, company_id, image_url, created_at, updated_at, sku_id) FROM stdin;
\.


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('items_id_seq', 1, false);


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY languages (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('languages_id_seq', 1, false);


--
-- Data for Name: linkedin_company_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY linkedin_company_pages (id, company_id, name, company_logo, user_social_channel_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: linkedin_company_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('linkedin_company_pages_id_seq', 1, false);


--
-- Data for Name: listeners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY listeners (id, client_id, user_id, email, username, password, status, is_active, is_requested, created_at, updated_at, company_name) FROM stdin;
\.


--
-- Name: listeners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('listeners_id_seq', 1, false);


--
-- Data for Name: payment_modes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY payment_modes (id, provider, created_at, updated_at) FROM stdin;
\.


--
-- Name: payment_modes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('payment_modes_id_seq', 1, false);


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY permissions (id, role_id, access_level, created_at, updated_at, feature_id) FROM stdin;
\.


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('permissions_id_seq', 1, false);


--
-- Data for Name: pricing_category_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pricing_category_types (id, category_type_id, pricing_plan_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: pricing_category_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pricing_category_types_id_seq', 1, false);


--
-- Data for Name: pricing_plan_channels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pricing_plan_channels (plannable_id, channel_id, id, plannable_type) FROM stdin;
\.


--
-- Data for Name: pricing_plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pricing_plans (id, name, country, created_at, updated_at, sms_count, email_count, amount, campaigns_count, fb_boost_budget, currency_id, is_default, customer_records_count, total_reach, is_active) FROM stdin;
\.


--
-- Name: pricing_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pricing_plans_id_seq', 1, false);


--
-- Data for Name: qr_code_campaigns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY qr_code_campaigns (id, qr_code_id, campaign_id, campaign_short_url, campaign_long_url, is_scheduled, created_at, updated_at, campaign_slug, is_active) FROM stdin;
\.


--
-- Name: qr_code_campaigns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('qr_code_campaigns_id_seq', 1, false);


--
-- Data for Name: qr_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY qr_codes (id, name, short_url, status, is_default, user_id, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at, slug, url, is_active) FROM stdin;
\.


--
-- Name: qr_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('qr_codes_id_seq', 1, false);


--
-- Data for Name: question_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY question_options (id, question_id, option, created_at, updated_at, "order", is_other, is_deactivated) FROM stdin;
\.


--
-- Name: question_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('question_options_id_seq', 1, false);


--
-- Data for Name: question_response_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY question_response_logs (id, question_id, provider, created_at, updated_at, user_id, cookie_token_id, is_processed, business_customer_info_id) FROM stdin;
\.


--
-- Name: question_response_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('question_response_logs_id_seq', 1, false);


--
-- Data for Name: question_styles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY question_styles (id, question_id, background, page_header, submit_button, question_text, button_text, answers, font_style, created_at, updated_at) FROM stdin;
\.


--
-- Name: question_styles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('question_styles_id_seq', 1, false);


--
-- Data for Name: question_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY question_types (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: question_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('question_types_id_seq', 1, false);


--
-- Data for Name: question_view_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY question_view_logs (id, question_id, provider, created_at, updated_at, user_id, cookie_token_id, is_processed, business_customer_info_id) FROM stdin;
\.


--
-- Name: question_view_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('question_view_logs_id_seq', 1, false);


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY questions (id, user_id, category_type_id, expiration_id, question, include_other, include_text, include_comment, created_at, updated_at, status, thanks_response, expired_at, qrcode_status, embed_url, video_url, question_type_id, video_type, slug, language, private_access, short_url, twitter_short_url, linkedin_short_url, qrcode_short_url, sms_short_url, view_count, response_count, video_url_thumb, tenant_id, embed_status) FROM stdin;
\.


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('questions_id_seq', 1, false);


--
-- Data for Name: response_cookie_infos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY response_cookie_infos (id, response_token_id, response_token_type, created_at, updated_at, cookie_token_id) FROM stdin;
\.


--
-- Name: response_cookie_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('response_cookie_infos_id_seq', 1, false);


--
-- Data for Name: response_customer_infos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY response_customer_infos (id, mobile, customer_name, email, response_status, view_status, gender, question_id, provider, date_of_birth, age, country, state, city, area, created_at, updated_at, cookie_token_id, user_id, is_deleted) FROM stdin;
\.


--
-- Name: response_customer_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('response_customer_infos_id_seq', 1, false);


--
-- Data for Name: revisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY revisions (id, content, is_updated, campaign_id, created_by, created_for, company_id, tenant_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('revisions_id_seq', 1, false);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles (id, name, is_default, user_id, created_at, updated_at, profile, visible_to_tenant) FROM stdin;
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roles_id_seq', 1, false);


--
-- Data for Name: s3_configs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s3_configs (id, identity_name, identity_pool_name, identity_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: s3_configs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s3_configs_id_seq', 1, false);


--
-- Data for Name: schedule_slots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schedule_slots (id, slot, schedule_type_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: schedule_slots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('schedule_slots_id_seq', 1, false);


--
-- Data for Name: schedule_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schedule_types (id, name, is_active, schedule_days, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: schedule_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('schedule_types_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20130311132526
20130313062352
20130314064242
20130314115828
20130315091055
20130316000151
20130318051459
20130319101749
20130319115354
20130319130126
20130320151149
20130321091000
20130327091312
20130328095824
20130328134226
20130328151204
20130401133154
20130405120723
20130405150019
20130409173641
20130418085805
20130418180320
20130422093456
20130423101425
20130502052919
20130515120304
20130520121450
20130525065935
20130527111346
20130528132948
20130610115710
20130612055943
20130814085736
20130923081746
20130930092756
20130930105434
20131008093215
20131031040530
20131104112031
20131104130521
20131114053612
20131114071515
20131115045507
20131115052302
20131118122901
20131121084917
20131122072907
20131122073136
20131122073212
20131125053428
20131125082546
20131125120731
20131202072531
20131202101029
20131204121744
20131205095642
20131206124231
20131206124437
20131207095454
20131212055406
20131212055952
20131213123259
20131213184449
20131213200358
20131215174718
20131215185652
20131215194333
20131217102216
20131223180225
20131224071758
20131225061051
20140106065616
20140108203339
20140113090354
20140113092001
20140113094919
20140113100856
20140211133140
20140213054453
20140217092902
20140224095922
20140227094745
20140227095948
20140303120019
20140304071750
20140317095936
20140318091556
20140319043410
20140409130753
20140516054951
20140519042619
20140519093435
20140520050855
20140520052742
20140523050036
20140526042254
20140526114316
20140530101922
20140530102428
20140530102913
20140530132143
20140602093800
20140606072100
20140610124545
20140616085854
20140616092302
20140616115122
20140617061948
20140619045329
20140619133911
20140626091111
20140627082712
20140627093457
20140630095240
20140701130205
20140701134035
20140702043731
20140702092954
20140702132624
20140703050926
20140715063014
20140801090916
20140819054722
20140825111857
20140905162059
20140915053809
20141006064638
20141008124210
20141014065457
20141014094240
20141015090831
20141024140701
20141106092447
20141107102925
20141112053656
20141112090943
20141119051338
20141218151347
20150209060907
20150218110325
20150224144207
20150226185039
20150227103943
20150319065649
20150319071530
20150401093303
20150424085750
20150424090535
20150428140658
20150429100308
20150429100334
20150430100845
20150430100919
20150508103916
20150512112657
20150518130131
20150518152155
20150518152220
20150528094750
20150601131231
20150615060407
20150618114559
20150623070329
20150629141751
20150703053607
20150704121733
20150706124210
20150723120606
20150804074135
20150805053553
20150810150457
20150810192221
20150813130301
20150820141355
20150828071431
20150908130122
20150912073302
20150919102541
20150921112715
20150923062012
20150923124045
20150930095219
20150930095847
20150930104514
20151006063006
20151008062357
20151013071949
20151013105107
20151013105157
20151013105245
20151013105417
20151013105446
20151013105844
20151013110200
20151013110231
20151013113805
20151013115227
20151013121314
20151013123024
20151013125936
20151014063202
20151014075055
20151019144424
20151023064819
20151026120952
20151027100959
20151027135938
20151030120050
20151031071620
20151105134313
20151105135938
20151106072418
20151114142406
20151115071033
20151119124403
20151120125607
20151127114852
20151127115845
20151201063814
20151203070018
20151209091808
20151211094608
20151211125430
20151218055537
20151224074853
20160203062846
20160204110206
20160224095052
20160303081143
20160401134324
20160411093220
20160418100411
20160519065053
20160629115449
20160809122948
20160818093010
20160818112228
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sessions (id, session_id, data, created_at, updated_at) FROM stdin;
2	9ab84a0e6f0d5c96f48c157c04a15a73	eyJfY3NyZl90b2tlbiI6Ilh2L2trZ1Q0eEIrZjk1WHdnTU5wdE5OV2VqT3lJ\ndWxSZEIvMnk1WVdDSkU9In0=\n	2018-01-29 08:09:23.420408	2018-01-29 08:09:23.420408
4	9e69f3575294810077f5f1e32d3f7756	eyJfY3NyZl90b2tlbiI6ImxweHZMdlh2emREaXROQjcvQk5iUDFiUVY3VUxw\nNUhHaTB0ZEQ5S2NTMzQ9IiwicmVxdWVzdF9yZWZlcnJlciI6Imh0dHA6Ly8x\nOTMuMTY0LjEzMS4yMzEvIn0=\n	2018-01-30 15:23:32.823355	2018-01-30 15:23:35.018405
3	0e79a91a6cf8e1da15b103621ed193af	eyJfY3NyZl90b2tlbiI6IkdESWd5cGxkanQwaTZMSTRRdmVzLzR2akRNVDdO\nOEdSVG9mblEvL0lPTjQ9IiwicmVxdWVzdF9yZWZlcnJlciI6Imh0dHA6Ly8x\nOTMuMTY0LjEzMS4yMzEvIn0=\n	2018-01-30 14:14:48.954461	2018-01-30 15:24:54.900278
1	b69590e7914ff46aac0a93619444a980	eyJfY3NyZl90b2tlbiI6IlV1K3dzNm5sWnpIQjU4Z2dXM0hGVFZ2aVRuTVlP\nVWdwY3ptSFVsaUpZVUk9IiwicmVxdWVzdF9yZWZlcnJlciI6Imh0dHA6Ly8x\nOTMuMTY0LjEzMS4yMzEvIn0=\n	2018-01-27 10:31:38.521272	2018-01-30 15:58:32.278212
5	319e79ba14d269678a5ae233e779d521	eyJfY3NyZl90b2tlbiI6IlRBZ0VtRnU4K1pGSUFRcS9Tb056Z1ZQSXc1ak0w\nSlVXei80NGxGOWFMelk9In0=\n	2018-01-30 16:09:16.599826	2018-01-30 16:09:16.599826
6	7d2ffd69a2131f50c738b1410a8633e9	eyJfY3NyZl90b2tlbiI6IkJ4UjNVWXhlMGt5SUJYS2hQZG9MRTJlVUtyZ0pr\ncU1EeUVsNnVCSGoyNW89IiwicmVxdWVzdF9yZWZlcnJlciI6Imh0dHA6Ly8x\nOTMuMTY0LjEzMS4yMzEvIn0=\n	2018-01-30 16:09:51.26609	2018-01-30 16:09:52.178591
7	9a68a46d4d4ef740f7262b08676dceff	eyJfY3NyZl90b2tlbiI6IjI1S0dKVndkYitWRGtoQzhTMm85UjNtb2taamNj\nbzlEaHN6bjJVM2JlUnM9In0=\n	2018-01-30 20:59:40.139564	2018-01-30 20:59:40.139564
8	7abfea8fab708d763aa3de2dd64c6c2a	eyJfY3NyZl90b2tlbiI6IjdLNkY0YjFYU2NuSUtQRGFlYjI5VStoNFZXUHlS\nK1FlZUJBaU9SeTlsRE09IiwicmVxdWVzdF9yZWZlcnJlciI6Imh0dHA6Ly8x\nOTMuMTY0LjEzMS4yMzEvIn0=\n	2018-01-31 07:48:21.973495	2018-01-31 07:48:23.109344
9	8beee0195b3da75dc241f5be0809ca8c	eyJfY3NyZl90b2tlbiI6IjVGNWZtVDZHSEVreWRnbFJPSVJHaVRCQlBRRUF2\nOTZwSU9ZMi9rYllHTW89IiwicmVxdWVzdF9yZWZlcnJlciI6Imh0dHA6Ly8x\nOTMuMTY0LjEzMS4yMzEvIn0=\n	2018-01-31 08:29:44.261406	2018-01-31 08:29:46.211691
10	ae18d8271017069d923c7e0e4fa56aa5	eyJfY3NyZl90b2tlbiI6IjBBWldXbnRoN0NhUVVoL3hOakhMT0dGaGZFQ1U4\nUVl6NDhLUERyQ1lCcDQ9IiwicmVxdWVzdF9yZWZlcnJlciI6Imh0dHA6Ly8x\nOTMuMTY0LjEzMS4yMzEvIn0=\n	2018-01-31 12:33:22.565299	2018-01-31 12:33:23.315175
11	a3a8223517e5fcffbd0eabf363f7abed	eyJfY3NyZl90b2tlbiI6ImpFT3piV0tlaU1ydnBocVBQUzdIdUp2b1UxcmpX\nNkp1bDJMWW5XNTIxbmM9IiwicmVxdWVzdF9yZWZlcnJlciI6Imh0dHA6Ly8x\nOTMuMTY0LjEzMS4yMzEvIn0=\n	2018-01-31 13:01:35.572624	2018-01-31 13:01:37.122266
12	ad402072774ed78c2d843638d5f0314a	eyJfY3NyZl90b2tlbiI6InFOcDlScjhJLzM3enE4YTZ3QWRmTGpxbWNHdzBU\ndERFS2I1NkNzVjNGRzg9In0=\n	2018-01-31 13:46:21.442125	2018-01-31 13:46:21.442125
13	29a1000629d48ead894f0039e37f7a87	eyJfY3NyZl90b2tlbiI6IkZwc3h4VituRG9TdFFzRVhUeldZN3lXUE9LVk9r\naFlqTFB0dEUyZmNLNTg9In0=\n	2018-01-31 14:31:36.448337	2018-01-31 14:31:36.448337
14	e66f6635ecebf0c9708b0541bab7c9dd	eyJfY3NyZl90b2tlbiI6IllxdVJXTXMrTmEzVHdoZ1BCK3dWR3p2N0ptZ3Bx\nSWJ4R2ZMb1FiVW9zdEE9In0=\n	2018-01-31 14:31:36.574265	2018-01-31 14:31:36.574265
17	9e87d70b2b3b13a7233f58dc8189d741	eyJfY3NyZl90b2tlbiI6ImhQaUJKejFRTk1haks2M25JMm5Fd0dDY2hiSncy\nbUlFUElLYXJCVmR0bmM9IiwicmVxdWVzdF9yZWZlcnJlciI6Imh0dHA6Ly8x\nOTMuMTY0LjEzMS4yMzEvIn0=\n	2018-02-01 08:59:48.803275	2018-02-01 08:59:50.493488
18	8011495e1c6d45a0faaf8fabad96ac9c	eyJfY3NyZl90b2tlbiI6ImZCb0dWaWpWTlBhWS96YjBUaDlLSWsrTHFBbWRF\nV01uRnZnTmhxSWlGMTQ9In0=\n	2018-02-01 09:22:33.207335	2018-02-01 09:22:33.207335
19	20931adcbf81c7ecc932a82bdd228572	eyJfY3NyZl90b2tlbiI6IldaUFd6QThGWTdpOVFJc2ZuR0I0OXd0VzhzZms5\nR0o3UGdReXo4ZmFuR289In0=\n	2018-02-01 09:30:51.835179	2018-02-01 09:30:51.835179
20	ca6bec04fad6ac2cd2b08d62845a90be	eyJmbGFzaCI6eyJkaXNjYXJkIjpbXSwiZmxhc2hlcyI6eyJub3RpY2UiOiJZ\nb3UgYXJlIG5vdCBsb2dnZWQgaW4uIFBsZWFzZSBsb2cgaW4ifX19\n	2018-02-01 09:46:22.494342	2018-02-01 09:46:22.494342
21	0d167e99706f30149180aeee26c1b5f6	eyJfY3NyZl90b2tlbiI6InkxL2VKQWg5OGtCVlRhNkxvc2l1QXQ4a1A1eUF0\nNXA4V0NqVy9kbW1LRUk9IiwicmVxdWVzdF9yZWZlcnJlciI6Imh0dHA6Ly8x\nOTMuMTY0LjEzMS4yMzE6MzAwMC8ifQ==\n	2018-02-01 17:56:42.36941	2018-02-01 17:57:24.595063
22	5298064ec08ef66c8c3552f4e25f7722	eyJfY3NyZl90b2tlbiI6InM3UE01b1l1OUFmckxuMmIvTitsUWsvVVBBSEhk\ncDJ0bW53UVZjclpOMG89IiwicmVxdWVzdF9yZWZlcnJlciI6Imh0dHA6Ly8x\nOTMuMTY0LjEzMS4yMzE6MzAwMC8ifQ==\n	2018-02-01 18:01:50.162964	2018-02-01 18:08:32.022423
23	fcc801879bb3fd9adaccd4af074d6b01	eyJfY3NyZl90b2tlbiI6IlRTT0VKd0MyWjg2a0RqRU56RTh5Tmh0cnNDbnlo\nWnhyc3h1cy9MRk03M009IiwicmVxdWVzdF9yZWZlcnJlciI6Imh0dHA6Ly8x\nOTMuMTY0LjEzMS4yMzE6MzAwMC8ifQ==\n	2018-02-02 07:51:58.789365	2018-02-02 07:51:59.947422
\.


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sessions_id_seq', 23, true);


--
-- Data for Name: share_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY share_details (id, customer_records_count, sms_count, email_count, user_id, created_at, updated_at, campaigns_count, fb_boost_budget, is_current, client_pricing_plan_id, total_reach) FROM stdin;
\.


--
-- Name: share_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('share_details_id_seq', 1, false);


--
-- Data for Name: share_mediums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY share_mediums (id, share_type, is_active, created_at, updated_at) FROM stdin;
\.


--
-- Name: share_mediums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('share_mediums_id_seq', 1, false);


--
-- Data for Name: share_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY share_questions (id, email_address, provider, social_id, social_token, user_id, created_at, updated_at, active, user_name, user_profile_image) FROM stdin;
\.


--
-- Name: share_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('share_questions_id_seq', 1, false);


--
-- Data for Name: share_summaries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY share_summaries (id, customer_records_count, sms_count, email_count, user_id, created_at, updated_at, fb_reach, campaign_id, share_detail_id) FROM stdin;
\.


--
-- Name: share_summaries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('share_summaries_id_seq', 1, false);


--
-- Data for Name: specifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY specifications (id, attrs, created_at, updated_at) FROM stdin;
\.


--
-- Name: specifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('specifications_id_seq', 1, false);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tags (id, name, user_id, company_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tags_id_seq', 1, false);


--
-- Data for Name: tenant_regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tenant_regions (id, name, description, user_id, is_active, created_at, updated_at) FROM stdin;
\.


--
-- Name: tenant_regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tenant_regions_id_seq', 1, false);


--
-- Data for Name: tenant_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tenant_types (id, name, description, is_active, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: tenant_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tenant_types_id_seq', 1, false);


--
-- Data for Name: tenants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tenants (id, name, address, client_id, created_at, updated_at, is_active, redirect_url, from_number, lat, lng, phone, contact_number, email, website_url, facebook_url, twitter_url, linkedin_url, logo_file_name, logo_content_type, logo_file_size, logo_updated_at, tenant_region_id, tenant_type_id, tenant_info) FROM stdin;
\.


--
-- Name: tenants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tenants_id_seq', 1, false);


--
-- Data for Name: transaction_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transaction_details (id, user_id, pricing_plan_id, amount, transaction_id, profile_id, created_at, updated_at, expiry_date, order_id, active, action, payment_status, zaakpay_response, response_dec, response_code, tracking_id, bank_ref_no, failure_message, payment_mode, card_name, status_code, status_message, currency, request_plan_id) FROM stdin;
\.


--
-- Name: transaction_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transaction_details_id_seq', 1, false);


--
-- Data for Name: user_action_lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_action_lists (id, completed, user_id, action_list_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: user_action_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_action_lists_id_seq', 1, false);


--
-- Data for Name: user_channels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_channels (id, channel_type, channel_id, share_medium_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: user_channels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_channels_id_seq', 1, false);


--
-- Data for Name: user_configs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_configs (id, engage, listen, others, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: user_configs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_configs_id_seq', 1, false);


--
-- Data for Name: user_invites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_invites (id, email, user_id, is_onboarded) FROM stdin;
\.


--
-- Name: user_invites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_invites_id_seq', 1, false);


--
-- Data for Name: user_location_channels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_location_channels (id, channel_id, channel_type, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: user_location_channels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_location_channels_id_seq', 1, false);


--
-- Data for Name: user_mobile_channels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_mobile_channels (id, channel, contact_group_id, user_id, active, created_at, updated_at) FROM stdin;
\.


--
-- Name: user_mobile_channels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_mobile_channels_id_seq', 1, false);


--
-- Data for Name: user_social_channels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_social_channels (id, channel, social_id, social_token, email, name, profile_image, user_id, active, created_at, updated_at, connections, valid_oauth, is_page, admin_id) FROM stdin;
\.


--
-- Name: user_social_channels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_social_channels_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, first_name, last_name, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, authentication_token, uid, parent_id, created_at, updated_at, admin, subscribe, exp_date, is_active, failed_attempts, unlock_token, locked_at, role_id, tenant_id, is_csv_processed, security_token, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, avatar_url, mobile, currency_id, invite_code) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Name: action_lists action_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY action_lists
    ADD CONSTRAINT action_lists_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: alert_channels alert_channels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alert_channels
    ADD CONSTRAINT alert_channels_pkey PRIMARY KEY (id);


--
-- Name: alert_configs alert_configs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alert_configs
    ADD CONSTRAINT alert_configs_pkey PRIMARY KEY (id);


--
-- Name: alert_event_channels alert_event_channels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alert_event_channels
    ADD CONSTRAINT alert_event_channels_pkey PRIMARY KEY (id);


--
-- Name: alert_events alert_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alert_events
    ADD CONSTRAINT alert_events_pkey PRIMARY KEY (id);


--
-- Name: alert_logs alert_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alert_logs
    ADD CONSTRAINT alert_logs_pkey PRIMARY KEY (id);


--
-- Name: alert_types alert_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alert_types
    ADD CONSTRAINT alert_types_pkey PRIMARY KEY (id);


--
-- Name: alerts alerts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alerts
    ADD CONSTRAINT alerts_pkey PRIMARY KEY (id);


--
-- Name: answer_analyses answer_analyses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY answer_analyses
    ADD CONSTRAINT answer_analyses_pkey PRIMARY KEY (id);


--
-- Name: answer_options answer_options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY answer_options
    ADD CONSTRAINT answer_options_pkey PRIMARY KEY (id);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: backlog_email_lists backlog_email_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY backlog_email_lists
    ADD CONSTRAINT backlog_email_lists_pkey PRIMARY KEY (id);


--
-- Name: beacons beacons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY beacons
    ADD CONSTRAINT beacons_pkey PRIMARY KEY (id);


--
-- Name: billing_info_details billing_info_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY billing_info_details
    ADD CONSTRAINT billing_info_details_pkey PRIMARY KEY (id);


--
-- Name: business_customer_infos business_customer_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY business_customer_infos
    ADD CONSTRAINT business_customer_infos_pkey PRIMARY KEY (id);


--
-- Name: campaign_channels campaign_channels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY campaign_channels
    ADD CONSTRAINT campaign_channels_pkey PRIMARY KEY (id);


--
-- Name: campaign_customers campaign_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY campaign_customers
    ADD CONSTRAINT campaign_customers_pkey PRIMARY KEY (id);


--
-- Name: campaign_customisations campaign_customisations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY campaign_customisations
    ADD CONSTRAINT campaign_customisations_pkey PRIMARY KEY (id);


--
-- Name: campaign_details campaign_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY campaign_details
    ADD CONSTRAINT campaign_details_pkey PRIMARY KEY (id);


--
-- Name: campaign_types campaign_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY campaign_types
    ADD CONSTRAINT campaign_types_pkey PRIMARY KEY (id);


--
-- Name: campaigns campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (id);


--
-- Name: category_types category_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category_types
    ADD CONSTRAINT category_types_pkey PRIMARY KEY (id);


--
-- Name: channels channels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY channels
    ADD CONSTRAINT channels_pkey PRIMARY KEY (id);


--
-- Name: client_languages client_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY client_languages
    ADD CONSTRAINT client_languages_pkey PRIMARY KEY (id);


--
-- Name: client_pricing_plans client_pricing_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY client_pricing_plans
    ADD CONSTRAINT client_pricing_plans_pkey PRIMARY KEY (id);


--
-- Name: client_settings client_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY client_settings
    ADD CONSTRAINT client_settings_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: company_types company_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY company_types
    ADD CONSTRAINT company_types_pkey PRIMARY KEY (id);


--
-- Name: contact_groups contact_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contact_groups
    ADD CONSTRAINT contact_groups_pkey PRIMARY KEY (id);


--
-- Name: cookie_tokens cookie_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cookie_tokens
    ADD CONSTRAINT cookie_tokens_pkey PRIMARY KEY (id);


--
-- Name: counts_stores counts_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY counts_stores
    ADD CONSTRAINT counts_stores_pkey PRIMARY KEY (id);


--
-- Name: cron_logs cron_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cron_logs
    ADD CONSTRAINT cron_logs_pkey PRIMARY KEY (id);


--
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs delayed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY delayed_jobs
    ADD CONSTRAINT delayed_jobs_pkey PRIMARY KEY (id);


--
-- Name: delivery_types delivery_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY delivery_types
    ADD CONSTRAINT delivery_types_pkey PRIMARY KEY (id);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: distribute_pricing_plans distribute_pricing_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY distribute_pricing_plans
    ADD CONSTRAINT distribute_pricing_plans_pkey PRIMARY KEY (id);


--
-- Name: email_activities email_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY email_activities
    ADD CONSTRAINT email_activities_pkey PRIMARY KEY (id);


--
-- Name: enterprise_api_endpoints enterprise_api_endpoints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enterprise_api_endpoints
    ADD CONSTRAINT enterprise_api_endpoints_pkey PRIMARY KEY (id);


--
-- Name: enterprise_contacts enterprise_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enterprise_contacts
    ADD CONSTRAINT enterprise_contacts_pkey PRIMARY KEY (id);


--
-- Name: executive_business_mappings executive_business_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY executive_business_mappings
    ADD CONSTRAINT executive_business_mappings_pkey PRIMARY KEY (id);


--
-- Name: executive_tenant_mappings executive_tenant_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY executive_tenant_mappings
    ADD CONSTRAINT executive_tenant_mappings_pkey PRIMARY KEY (id);


--
-- Name: ezetap_configs ezetap_configs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ezetap_configs
    ADD CONSTRAINT ezetap_configs_pkey PRIMARY KEY (id);


--
-- Name: features features_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY features
    ADD CONSTRAINT features_pkey PRIMARY KEY (id);


--
-- Name: font_styles font_styles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY font_styles
    ADD CONSTRAINT font_styles_pkey PRIMARY KEY (id);


--
-- Name: funnel_marketing_states funnel_marketing_states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funnel_marketing_states
    ADD CONSTRAINT funnel_marketing_states_pkey PRIMARY KEY (id);


--
-- Name: funnel_sources funnel_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funnel_sources
    ADD CONSTRAINT funnel_sources_pkey PRIMARY KEY (id);


--
-- Name: funnel_states funnel_states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funnel_states
    ADD CONSTRAINT funnel_states_pkey PRIMARY KEY (id);


--
-- Name: funnel_types funnel_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funnel_types
    ADD CONSTRAINT funnel_types_pkey PRIMARY KEY (id);


--
-- Name: funnels funnels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funnels
    ADD CONSTRAINT funnels_pkey PRIMARY KEY (id);


--
-- Name: industry_tags industry_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY industry_tags
    ADD CONSTRAINT industry_tags_pkey PRIMARY KEY (id);


--
-- Name: industry_types industry_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY industry_types
    ADD CONSTRAINT industry_types_pkey PRIMARY KEY (id);


--
-- Name: inq_campaigns inq_campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inq_campaigns
    ADD CONSTRAINT inq_campaigns_pkey PRIMARY KEY (id);


--
-- Name: invites invites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY invites
    ADD CONSTRAINT invites_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: linkedin_company_pages linkedin_company_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY linkedin_company_pages
    ADD CONSTRAINT linkedin_company_pages_pkey PRIMARY KEY (id);


--
-- Name: listeners listeners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY listeners
    ADD CONSTRAINT listeners_pkey PRIMARY KEY (id);


--
-- Name: payment_modes payment_modes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payment_modes
    ADD CONSTRAINT payment_modes_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: campaign_activity_stats power_share_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY campaign_activity_stats
    ADD CONSTRAINT power_share_stats_pkey PRIMARY KEY (id);


--
-- Name: pricing_category_types pricing_category_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pricing_category_types
    ADD CONSTRAINT pricing_category_types_pkey PRIMARY KEY (id);


--
-- Name: pricing_plans pricing_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pricing_plans
    ADD CONSTRAINT pricing_plans_pkey PRIMARY KEY (id);


--
-- Name: qr_code_campaigns qr_code_campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY qr_code_campaigns
    ADD CONSTRAINT qr_code_campaigns_pkey PRIMARY KEY (id);


--
-- Name: qr_codes qr_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY qr_codes
    ADD CONSTRAINT qr_codes_pkey PRIMARY KEY (id);


--
-- Name: question_options question_options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_options
    ADD CONSTRAINT question_options_pkey PRIMARY KEY (id);


--
-- Name: question_response_logs question_response_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_response_logs
    ADD CONSTRAINT question_response_logs_pkey PRIMARY KEY (id);


--
-- Name: question_styles question_styles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_styles
    ADD CONSTRAINT question_styles_pkey PRIMARY KEY (id);


--
-- Name: question_types question_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_types
    ADD CONSTRAINT question_types_pkey PRIMARY KEY (id);


--
-- Name: question_view_logs question_view_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question_view_logs
    ADD CONSTRAINT question_view_logs_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: response_cookie_infos response_cookie_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY response_cookie_infos
    ADD CONSTRAINT response_cookie_infos_pkey PRIMARY KEY (id);


--
-- Name: response_customer_infos response_customer_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY response_customer_infos
    ADD CONSTRAINT response_customer_infos_pkey PRIMARY KEY (id);


--
-- Name: revisions revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY revisions
    ADD CONSTRAINT revisions_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: s3_configs s3_configs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY s3_configs
    ADD CONSTRAINT s3_configs_pkey PRIMARY KEY (id);


--
-- Name: schedule_slots schedule_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedule_slots
    ADD CONSTRAINT schedule_slots_pkey PRIMARY KEY (id);


--
-- Name: schedule_types schedule_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedule_types
    ADD CONSTRAINT schedule_types_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: share_details share_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY share_details
    ADD CONSTRAINT share_details_pkey PRIMARY KEY (id);


--
-- Name: share_mediums share_mediums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY share_mediums
    ADD CONSTRAINT share_mediums_pkey PRIMARY KEY (id);


--
-- Name: share_questions share_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY share_questions
    ADD CONSTRAINT share_questions_pkey PRIMARY KEY (id);


--
-- Name: share_summaries share_summaries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY share_summaries
    ADD CONSTRAINT share_summaries_pkey PRIMARY KEY (id);


--
-- Name: specifications specifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY specifications
    ADD CONSTRAINT specifications_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: tenant_regions tenant_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tenant_regions
    ADD CONSTRAINT tenant_regions_pkey PRIMARY KEY (id);


--
-- Name: tenant_types tenant_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tenant_types
    ADD CONSTRAINT tenant_types_pkey PRIMARY KEY (id);


--
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);


--
-- Name: transaction_details transaction_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transaction_details
    ADD CONSTRAINT transaction_details_pkey PRIMARY KEY (id);


--
-- Name: user_action_lists user_action_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_action_lists
    ADD CONSTRAINT user_action_lists_pkey PRIMARY KEY (id);


--
-- Name: user_channels user_channels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_channels
    ADD CONSTRAINT user_channels_pkey PRIMARY KEY (id);


--
-- Name: user_configs user_configs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_configs
    ADD CONSTRAINT user_configs_pkey PRIMARY KEY (id);


--
-- Name: user_invites user_invites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_invites
    ADD CONSTRAINT user_invites_pkey PRIMARY KEY (id);


--
-- Name: user_location_channels user_location_channels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_location_channels
    ADD CONSTRAINT user_location_channels_pkey PRIMARY KEY (id);


--
-- Name: user_mobile_channels user_mobile_channels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_mobile_channels
    ADD CONSTRAINT user_mobile_channels_pkey PRIMARY KEY (id);


--
-- Name: user_social_channels user_social_channels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_social_channels
    ADD CONSTRAINT user_social_channels_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: analyses_question_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX analyses_question_id ON answer_analyses USING btree (question_id);


--
-- Name: answers_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX answers_index ON answers USING btree (question_id);


--
-- Name: delayed_jobs_priority; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX delayed_jobs_priority ON delayed_jobs USING btree (priority, run_at);


--
-- Name: index_alert_configs_on_alert_event_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_alert_configs_on_alert_event_id ON alert_configs USING btree (alert_event_id);


--
-- Name: index_alert_event_channels_on_alert_channel_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_alert_event_channels_on_alert_channel_id ON alert_event_channels USING btree (alert_channel_id);


--
-- Name: index_alert_event_channels_on_alert_event_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_alert_event_channels_on_alert_event_id ON alert_event_channels USING btree (alert_event_id);


--
-- Name: index_alert_events_on_alert_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_alert_events_on_alert_id ON alert_events USING btree (alert_id);


--
-- Name: index_alert_events_on_alert_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_alert_events_on_alert_type_id ON alert_events USING btree (alert_type_id);


--
-- Name: index_alert_events_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_alert_events_on_user_id ON alert_events USING btree (user_id);


--
-- Name: index_alert_logs_on_alert_channel_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_alert_logs_on_alert_channel_id ON alert_logs USING btree (alert_channel_id);


--
-- Name: index_alert_logs_on_alert_event_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_alert_logs_on_alert_event_id ON alert_logs USING btree (alert_event_id);


--
-- Name: index_alert_logs_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_alert_logs_on_user_id ON alert_logs USING btree (user_id);


--
-- Name: index_answer_analyses_on_answer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_answer_analyses_on_answer_id ON answer_analyses USING btree (answer_id);


--
-- Name: index_answer_options_on_question_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_answer_options_on_question_id ON answer_options USING btree (question_id);


--
-- Name: index_answers_on_customers_info_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_answers_on_customers_info_id ON answers USING btree (customers_info_id);


--
-- Name: index_answers_on_question_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_answers_on_question_id ON answers USING btree (question_id);


--
-- Name: index_answers_on_question_option_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_answers_on_question_option_id ON answers USING btree (question_option_id);


--
-- Name: index_answers_on_question_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_answers_on_question_type_id ON answers USING btree (question_type_id);


--
-- Name: index_attachments_on_attachable_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_attachments_on_attachable_id ON attachments USING btree (attachable_id);


--
-- Name: index_attachments_on_attachable_id_and_attachable_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_attachments_on_attachable_id_and_attachable_type ON attachments USING btree (attachable_id, attachable_type);


--
-- Name: index_billing_info_details_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_billing_info_details_on_user_id ON billing_info_details USING btree (user_id);


--
-- Name: index_business_customer_infos_on_consumer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_business_customer_infos_on_consumer_id ON business_customer_infos USING btree (consumer_id);


--
-- Name: index_business_customer_infos_on_cookie_token_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_business_customer_infos_on_cookie_token_id ON business_customer_infos USING btree (cookie_token_id);


--
-- Name: index_business_customer_infos_on_country; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_business_customer_infos_on_country ON business_customer_infos USING btree (country);


--
-- Name: index_business_customer_infos_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_business_customer_infos_on_email ON business_customer_infos USING btree (email);


--
-- Name: index_business_customer_infos_on_question_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_business_customer_infos_on_question_id ON business_customer_infos USING btree (question_id);


--
-- Name: index_business_customer_infos_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_business_customer_infos_on_user_id ON business_customer_infos USING btree (user_id);


--
-- Name: index_campaign_channels_on_campaign_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_campaign_channels_on_campaign_id ON campaign_channels USING btree (campaign_id);


--
-- Name: index_campaign_channels_on_share_medium_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_campaign_channels_on_share_medium_id ON campaign_channels USING btree (share_medium_id);


--
-- Name: index_campaign_channels_on_user_channel_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_campaign_channels_on_user_channel_id ON campaign_channels USING btree (user_channel_id);


--
-- Name: index_campaign_customers_on_business_customer_info_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_campaign_customers_on_business_customer_info_id ON campaign_customers USING btree (business_customer_info_id);


--
-- Name: index_campaign_customers_on_campaign_channel_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_campaign_customers_on_campaign_channel_id ON campaign_customers USING btree (campaign_channel_id);


--
-- Name: index_campaign_customers_on_campaign_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_campaign_customers_on_campaign_id ON campaign_customers USING btree (campaign_id);


--
-- Name: index_campaign_details_on_campaign_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_campaign_details_on_campaign_id ON campaign_details USING btree (campaign_id);


--
-- Name: index_campaign_details_on_share_medium_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_campaign_details_on_share_medium_id ON campaign_details USING btree (share_medium_id);


--
-- Name: index_campaign_details_on_template_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_campaign_details_on_template_id ON campaign_details USING btree (template_id);


--
-- Name: index_campaigns_on_service_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_campaigns_on_service_user_id ON campaigns USING btree (service_user_id);


--
-- Name: index_campaigns_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_campaigns_on_slug ON campaigns USING btree (slug);


--
-- Name: index_client_languages_on_client_setting_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_client_languages_on_client_setting_id ON client_languages USING btree (client_setting_id);


--
-- Name: index_client_languages_on_language_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_client_languages_on_language_id ON client_languages USING btree (language_id);


--
-- Name: index_client_settings_on_pricing_plan_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_client_settings_on_pricing_plan_id ON client_settings USING btree (pricing_plan_id);


--
-- Name: index_client_settings_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_client_settings_on_user_id ON client_settings USING btree (user_id);


--
-- Name: index_contact_groups_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_contact_groups_on_user_id ON contact_groups USING btree (user_id);


--
-- Name: index_counts_stores_on_counts_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_counts_stores_on_counts_key ON counts_stores USING gin (counts_key);


--
-- Name: index_counts_stores_on_question_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_counts_stores_on_question_id ON counts_stores USING btree (question_id);


--
-- Name: index_customers_contact_groups_on_business_customer_info_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_customers_contact_groups_on_business_customer_info_id ON customers_contact_groups USING btree (business_customer_info_id);


--
-- Name: index_customers_contact_groups_on_contact_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_customers_contact_groups_on_contact_group_id ON customers_contact_groups USING btree (contact_group_id);


--
-- Name: index_executive_business_mappings_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_executive_business_mappings_on_company_id ON executive_business_mappings USING btree (company_id);


--
-- Name: index_executive_business_mappings_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_executive_business_mappings_on_user_id ON executive_business_mappings USING btree (user_id);


--
-- Name: index_executive_tenant_mappings_on_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_executive_tenant_mappings_on_tenant_id ON executive_tenant_mappings USING btree (tenant_id);


--
-- Name: index_executive_tenant_mappings_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_executive_tenant_mappings_on_user_id ON executive_tenant_mappings USING btree (user_id);


--
-- Name: index_listeners_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_listeners_on_user_id ON listeners USING btree (user_id);


--
-- Name: index_permissions_on_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_permissions_on_role_id ON permissions USING btree (role_id);


--
-- Name: index_pricing_category_types_on_category_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_pricing_category_types_on_category_type_id ON pricing_category_types USING btree (category_type_id);


--
-- Name: index_pricing_category_types_on_pricing_plan_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_pricing_category_types_on_pricing_plan_id ON pricing_category_types USING btree (pricing_plan_id);


--
-- Name: index_qr_code_campaigns_on_campaign_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_qr_code_campaigns_on_campaign_slug ON qr_code_campaigns USING btree (campaign_slug);


--
-- Name: index_qr_codes_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_qr_codes_on_slug ON qr_codes USING btree (slug);


--
-- Name: index_qr_codes_on_url; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_qr_codes_on_url ON qr_codes USING btree (url);


--
-- Name: index_question_options_on_question_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_question_options_on_question_id ON question_options USING btree (question_id);


--
-- Name: index_question_response_logs_on_cookie_token_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_question_response_logs_on_cookie_token_id ON question_response_logs USING btree (cookie_token_id);


--
-- Name: index_question_response_logs_on_question_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_question_response_logs_on_question_id ON question_response_logs USING btree (question_id);


--
-- Name: index_question_response_logs_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_question_response_logs_on_user_id ON question_response_logs USING btree (user_id);


--
-- Name: index_question_styles_on_question_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_question_styles_on_question_id ON question_styles USING btree (question_id);


--
-- Name: index_question_view_logs_on_cookie_token_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_question_view_logs_on_cookie_token_id ON question_view_logs USING btree (cookie_token_id);


--
-- Name: index_question_view_logs_on_question_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_question_view_logs_on_question_id ON question_view_logs USING btree (question_id);


--
-- Name: index_question_view_logs_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_question_view_logs_on_user_id ON question_view_logs USING btree (user_id);


--
-- Name: index_questions_on_category_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_questions_on_category_type_id ON questions USING btree (category_type_id);


--
-- Name: index_questions_on_expiration_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_questions_on_expiration_id ON questions USING btree (expiration_id);


--
-- Name: index_questions_on_question_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_questions_on_question_type_id ON questions USING btree (question_type_id);


--
-- Name: index_questions_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_questions_on_slug ON questions USING btree (slug);


--
-- Name: index_questions_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_questions_on_user_id ON questions USING btree (user_id);


--
-- Name: index_response_cookie_infos_on_response_token_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_response_cookie_infos_on_response_token_id ON response_cookie_infos USING btree (response_token_id);


--
-- Name: index_response_customer_infos_on_cookie_token_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_response_customer_infos_on_cookie_token_id ON response_customer_infos USING btree (cookie_token_id);


--
-- Name: index_response_customer_infos_on_question_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_response_customer_infos_on_question_id ON response_customer_infos USING btree (question_id);


--
-- Name: index_response_customer_infos_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_response_customer_infos_on_user_id ON response_customer_infos USING btree (user_id);


--
-- Name: index_revisions_on_campaign_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_revisions_on_campaign_id ON revisions USING btree (campaign_id);


--
-- Name: index_revisions_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_revisions_on_company_id ON revisions USING btree (company_id);


--
-- Name: index_revisions_on_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_revisions_on_created_by ON revisions USING btree (created_by);


--
-- Name: index_revisions_on_created_for; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_revisions_on_created_for ON revisions USING btree (created_for);


--
-- Name: index_revisions_on_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_revisions_on_tenant_id ON revisions USING btree (tenant_id);


--
-- Name: index_roles_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_roles_on_user_id ON roles USING btree (user_id);


--
-- Name: index_sessions_on_session_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_sessions_on_session_id ON sessions USING btree (session_id);


--
-- Name: index_sessions_on_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_sessions_on_updated_at ON sessions USING btree (updated_at);


--
-- Name: index_share_details_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_share_details_on_user_id ON share_details USING btree (user_id);


--
-- Name: index_share_questions_on_social_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_share_questions_on_social_id ON share_questions USING btree (social_id);


--
-- Name: index_share_questions_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_share_questions_on_user_id ON share_questions USING btree (user_id);


--
-- Name: index_share_summaries_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_share_summaries_on_user_id ON share_summaries USING btree (user_id);


--
-- Name: index_transaction_details_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_transaction_details_on_order_id ON transaction_details USING btree (order_id);


--
-- Name: index_transaction_details_on_pricing_plan_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_transaction_details_on_pricing_plan_id ON transaction_details USING btree (pricing_plan_id);


--
-- Name: index_transaction_details_on_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_transaction_details_on_profile_id ON transaction_details USING btree (profile_id);


--
-- Name: index_transaction_details_on_transaction_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_transaction_details_on_transaction_id ON transaction_details USING btree (transaction_id);


--
-- Name: index_transaction_details_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_transaction_details_on_user_id ON transaction_details USING btree (user_id);


--
-- Name: index_user_channels_on_channel_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_channels_on_channel_id ON user_channels USING btree (channel_id);


--
-- Name: index_user_channels_on_share_medium_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_channels_on_share_medium_id ON user_channels USING btree (share_medium_id);


--
-- Name: index_user_location_channels_on_channel_id_and_channel_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_location_channels_on_channel_id_and_channel_type ON user_location_channels USING btree (channel_id, channel_type);


--
-- Name: index_user_mobile_channels_on_contact_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_mobile_channels_on_contact_group_id ON user_mobile_channels USING btree (contact_group_id);


--
-- Name: index_users_on_authentication_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_authentication_token ON users USING btree (authentication_token);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_parent_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_on_parent_id ON users USING btree (parent_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_on_role_id ON users USING btree (role_id);


--
-- Name: index_users_on_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_on_tenant_id ON users USING btree (tenant_id);


--
-- Name: qs_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX qs_tenant_id ON questions USING btree (tenant_id);


--
-- Name: res_cookie_token_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX res_cookie_token_id ON response_cookie_infos USING btree (cookie_token_id);


--
-- Name: res_response_token_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX res_response_token_type ON response_cookie_infos USING btree (response_token_type);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

