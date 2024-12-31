--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.6 (Homebrew)

-- Started on 2024-12-31 09:40:46 EST

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

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4144 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 999 (class 1247 OID 24820)
-- Name: cart_status_enum; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.cart_status_enum AS ENUM (
    'processing',
    'paid'
);


ALTER TYPE public.cart_status_enum OWNER TO root;

--
-- TOC entry 960 (class 1247 OID 24679)
-- Name: user_status_enum; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.user_status_enum AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE public.user_status_enum OWNER TO root;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 24715)
-- Name: accounts; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.accounts (
    id integer NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    update_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(100)
);


ALTER TABLE public.accounts OWNER TO root;

--
-- TOC entry 227 (class 1259 OID 24741)
-- Name: accounts_counter_settings; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.accounts_counter_settings (
    id integer NOT NULL,
    type character varying NOT NULL,
    current_count integer NOT NULL,
    initial_count integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    "accountId" integer,
    "createdByUserId" integer,
    "updatedByUserId" integer
);


ALTER TABLE public.accounts_counter_settings OWNER TO root;

--
-- TOC entry 226 (class 1259 OID 24740)
-- Name: accounts_counter_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.accounts_counter_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accounts_counter_settings_id_seq OWNER TO root;

--
-- TOC entry 4145 (class 0 OID 0)
-- Dependencies: 226
-- Name: accounts_counter_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.accounts_counter_settings_id_seq OWNED BY public.accounts_counter_settings.id;


--
-- TOC entry 220 (class 1259 OID 24714)
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accounts_id_seq OWNER TO root;

--
-- TOC entry 4146 (class 0 OID 0)
-- Dependencies: 220
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- TOC entry 225 (class 1259 OID 24734)
-- Name: accounts_stores; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.accounts_stores (
    id integer NOT NULL,
    "accountId" integer,
    "storeId" integer
);


ALTER TABLE public.accounts_stores OWNER TO root;

--
-- TOC entry 224 (class 1259 OID 24733)
-- Name: accounts_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.accounts_stores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accounts_stores_id_seq OWNER TO root;

--
-- TOC entry 4147 (class 0 OID 0)
-- Dependencies: 224
-- Name: accounts_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.accounts_stores_id_seq OWNED BY public.accounts_stores.id;


--
-- TOC entry 219 (class 1259 OID 24699)
-- Name: accounts_users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.accounts_users (
    id integer NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL,
    update_at timestamp without time zone DEFAULT now() NOT NULL,
    is_owner boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true,
    decimals_separator character(1) DEFAULT '.'::bpchar NOT NULL,
    thousands_separator character(1) DEFAULT ','::bpchar NOT NULL,
    lang character varying DEFAULT 'es'::character varying,
    "accountId" integer,
    "userId" integer
);


ALTER TABLE public.accounts_users OWNER TO root;

--
-- TOC entry 218 (class 1259 OID 24698)
-- Name: accounts_users_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.accounts_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accounts_users_id_seq OWNER TO root;

--
-- TOC entry 4148 (class 0 OID 0)
-- Dependencies: 218
-- Name: accounts_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.accounts_users_id_seq OWNED BY public.accounts_users.id;


--
-- TOC entry 309 (class 1259 OID 25262)
-- Name: admin_user; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.admin_user (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    status boolean DEFAULT true NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    full_name character varying,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.admin_user OWNER TO root;

--
-- TOC entry 308 (class 1259 OID 25261)
-- Name: admin_user_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.admin_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_user_id_seq OWNER TO root;

--
-- TOC entry 4149 (class 0 OID 0)
-- Dependencies: 308
-- Name: admin_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.admin_user_id_seq OWNED BY public.admin_user.id;


--
-- TOC entry 231 (class 1259 OID 24762)
-- Name: app_session; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.app_session (
    id integer NOT NULL,
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp without time zone NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    "userId" integer
);


ALTER TABLE public.app_session OWNER TO root;

--
-- TOC entry 230 (class 1259 OID 24761)
-- Name: app_session_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.app_session_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_session_id_seq OWNER TO root;

--
-- TOC entry 4150 (class 0 OID 0)
-- Dependencies: 230
-- Name: app_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.app_session_id_seq OWNED BY public.app_session.id;


--
-- TOC entry 249 (class 1259 OID 24871)
-- Name: attribute; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.attribute (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    type character varying,
    is_required boolean DEFAULT false NOT NULL,
    display_on_frontend boolean DEFAULT false NOT NULL,
    sort_order integer NOT NULL,
    is_filterable boolean DEFAULT false NOT NULL,
    code character varying,
    name character varying
);


ALTER TABLE public.attribute OWNER TO root;

--
-- TOC entry 251 (class 1259 OID 24897)
-- Name: attribute_group; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.attribute_group (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    group_name text NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.attribute_group OWNER TO root;

--
-- TOC entry 250 (class 1259 OID 24896)
-- Name: attribute_group_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.attribute_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attribute_group_id_seq OWNER TO root;

--
-- TOC entry 4151 (class 0 OID 0)
-- Dependencies: 250
-- Name: attribute_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.attribute_group_id_seq OWNED BY public.attribute_group.id;


--
-- TOC entry 324 (class 1259 OID 98972)
-- Name: attribute_groups_attribute_group; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.attribute_groups_attribute_group (
    "attributeId" integer NOT NULL,
    "attributeGroupId" integer NOT NULL
);


ALTER TABLE public.attribute_groups_attribute_group OWNER TO root;

--
-- TOC entry 248 (class 1259 OID 24870)
-- Name: attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.attribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attribute_id_seq OWNER TO root;

--
-- TOC entry 4152 (class 0 OID 0)
-- Dependencies: 248
-- Name: attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.attribute_id_seq OWNED BY public.attribute.id;


--
-- TOC entry 245 (class 1259 OID 24852)
-- Name: attribute_option; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.attribute_option (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "attributeId" integer,
    code character varying,
    text character varying
);


ALTER TABLE public.attribute_option OWNER TO root;

--
-- TOC entry 244 (class 1259 OID 24851)
-- Name: attribute_option_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.attribute_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attribute_option_id_seq OWNER TO root;

--
-- TOC entry 4153 (class 0 OID 0)
-- Dependencies: 244
-- Name: attribute_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.attribute_option_id_seq OWNED BY public.attribute_option.id;


--
-- TOC entry 241 (class 1259 OID 24826)
-- Name: cart; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.cart (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    sid character varying,
    currency character varying NOT NULL,
    customer_id integer,
    customer_group_id smallint,
    customer_email character varying,
    customer_full_name character varying,
    user_ip character varying,
    status public.cart_status_enum DEFAULT 'processing'::public.cart_status_enum NOT NULL,
    coupon character varying,
    shipping_fee_excl_tax numeric(12,4),
    shipping_fee_incl_tax numeric(12,4),
    discount_amount numeric(12,4),
    sub_total numeric(12,4) NOT NULL,
    sub_total_incl_tax numeric(12,4) NOT NULL,
    total_qty integer NOT NULL,
    total_weight numeric(12,4),
    tax_amount numeric(12,4) NOT NULL,
    grand_total numeric(12,4) NOT NULL,
    shipping_method character varying,
    shipping_method_name character varying,
    shipping_zone_id integer,
    shipping_address_id integer,
    payment_method character varying,
    payment_method_name character varying,
    billing_address_id integer,
    shipping_note text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    "shippingZoneId" integer
);


ALTER TABLE public.cart OWNER TO root;

--
-- TOC entry 307 (class 1259 OID 25252)
-- Name: cart_address; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.cart_address (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    full_name character varying,
    postcode character varying,
    telephone character varying,
    country character varying,
    province character varying,
    city character varying,
    address_1 character varying,
    address_2 character varying
);


ALTER TABLE public.cart_address OWNER TO root;

--
-- TOC entry 306 (class 1259 OID 25251)
-- Name: cart_address_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.cart_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_address_id_seq OWNER TO root;

--
-- TOC entry 4154 (class 0 OID 0)
-- Dependencies: 306
-- Name: cart_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.cart_address_id_seq OWNED BY public.cart_address.id;


--
-- TOC entry 240 (class 1259 OID 24825)
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_id_seq OWNER TO root;

--
-- TOC entry 4155 (class 0 OID 0)
-- Dependencies: 240
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;


--
-- TOC entry 275 (class 1259 OID 25061)
-- Name: cart_item; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.cart_item (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    cart_id integer NOT NULL,
    product_id integer NOT NULL,
    product_sku character varying NOT NULL,
    product_name text NOT NULL,
    thumbnail character varying,
    product_weight numeric(12,4),
    product_price numeric(12,4) NOT NULL,
    product_price_incl_tax numeric(12,4) NOT NULL,
    qty integer NOT NULL,
    final_price numeric(12,4) NOT NULL,
    final_price_incl_tax numeric(12,4) NOT NULL,
    tax_percent numeric(12,4) NOT NULL,
    tax_amount numeric(12,4) NOT NULL,
    discount_amount numeric(12,4) NOT NULL,
    sub_total numeric(12,4) NOT NULL,
    total numeric(12,4) NOT NULL,
    variant_group_id integer,
    variant_options text,
    product_custom_options text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    "cartId" integer,
    "productId" integer
);


ALTER TABLE public.cart_item OWNER TO root;

--
-- TOC entry 274 (class 1259 OID 25060)
-- Name: cart_item_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.cart_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_item_id_seq OWNER TO root;

--
-- TOC entry 4156 (class 0 OID 0)
-- Dependencies: 274
-- Name: cart_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.cart_item_id_seq OWNED BY public.cart_item.id;


--
-- TOC entry 277 (class 1259 OID 25073)
-- Name: catalog_classes; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.catalog_classes (
    id integer NOT NULL,
    create_at timestamp with time zone DEFAULT now() NOT NULL,
    update_at timestamp with time zone DEFAULT now() NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.catalog_classes OWNER TO root;

--
-- TOC entry 276 (class 1259 OID 25072)
-- Name: catalog_classes_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.catalog_classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.catalog_classes_id_seq OWNER TO root;

--
-- TOC entry 4157 (class 0 OID 0)
-- Dependencies: 276
-- Name: catalog_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.catalog_classes_id_seq OWNED BY public.catalog_classes.id;


--
-- TOC entry 279 (class 1259 OID 25082)
-- Name: catalog_types; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.catalog_types (
    id integer NOT NULL,
    create_at timestamp with time zone DEFAULT now() NOT NULL,
    update_at timestamp with time zone DEFAULT now() NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    catalog_class_id integer
);


ALTER TABLE public.catalog_types OWNER TO root;

--
-- TOC entry 278 (class 1259 OID 25081)
-- Name: catalog_types_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.catalog_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.catalog_types_id_seq OWNER TO root;

--
-- TOC entry 4158 (class 0 OID 0)
-- Dependencies: 278
-- Name: catalog_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.catalog_types_id_seq OWNED BY public.catalog_types.id;


--
-- TOC entry 281 (class 1259 OID 25091)
-- Name: catalogs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.catalogs (
    id integer NOT NULL,
    create_at timestamp with time zone DEFAULT now() NOT NULL,
    update_at timestamp with time zone DEFAULT now() NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    custom_properties jsonb,
    catalog_type_id integer,
    parent_catalog_id integer
);


ALTER TABLE public.catalogs OWNER TO root;

--
-- TOC entry 280 (class 1259 OID 25090)
-- Name: catalogs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.catalogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.catalogs_id_seq OWNER TO root;

--
-- TOC entry 4159 (class 0 OID 0)
-- Dependencies: 280
-- Name: catalogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.catalogs_id_seq OWNED BY public.catalogs.id;


--
-- TOC entry 255 (class 1259 OID 24922)
-- Name: category; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.category (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    status boolean NOT NULL,
    parent_id integer,
    include_in_nav boolean NOT NULL,
    "position" smallint,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    name character varying(255) NOT NULL,
    image character varying(255) NOT NULL
);


ALTER TABLE public.category OWNER TO root;

--
-- TOC entry 253 (class 1259 OID 24909)
-- Name: category_description; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.category_description (
    id integer NOT NULL,
    category_description_category_id integer NOT NULL,
    name character varying NOT NULL,
    short_description text,
    description text,
    image character varying,
    meta_title text,
    meta_keywords text,
    meta_description text,
    url_key character varying NOT NULL
);


ALTER TABLE public.category_description OWNER TO root;

--
-- TOC entry 252 (class 1259 OID 24908)
-- Name: category_description_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.category_description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_description_id_seq OWNER TO root;

--
-- TOC entry 4160 (class 0 OID 0)
-- Dependencies: 252
-- Name: category_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.category_description_id_seq OWNED BY public.category_description.id;


--
-- TOC entry 254 (class 1259 OID 24921)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_id_seq OWNER TO root;

--
-- TOC entry 4161 (class 0 OID 0)
-- Dependencies: 254
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 313 (class 1259 OID 25290)
-- Name: cms_page; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.cms_page (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    layout character varying NOT NULL,
    status boolean,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.cms_page OWNER TO root;

--
-- TOC entry 311 (class 1259 OID 25277)
-- Name: cms_page_description; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.cms_page_description (
    id integer NOT NULL,
    cms_page_description_cms_page_id integer,
    url_key character varying NOT NULL,
    name character varying NOT NULL,
    content text,
    meta_title character varying,
    meta_keywords character varying,
    meta_description text
);


ALTER TABLE public.cms_page_description OWNER TO root;

--
-- TOC entry 310 (class 1259 OID 25276)
-- Name: cms_page_description_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.cms_page_description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cms_page_description_id_seq OWNER TO root;

--
-- TOC entry 4162 (class 0 OID 0)
-- Dependencies: 310
-- Name: cms_page_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.cms_page_description_id_seq OWNED BY public.cms_page_description.id;


--
-- TOC entry 312 (class 1259 OID 25289)
-- Name: cms_page_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.cms_page_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cms_page_id_seq OWNER TO root;

--
-- TOC entry 4163 (class 0 OID 0)
-- Dependencies: 312
-- Name: cms_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.cms_page_id_seq OWNED BY public.cms_page.id;


--
-- TOC entry 257 (class 1259 OID 24944)
-- Name: collection; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.collection (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    description text,
    code character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.collection OWNER TO root;

--
-- TOC entry 256 (class 1259 OID 24943)
-- Name: collection_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.collection_id_seq OWNER TO root;

--
-- TOC entry 4164 (class 0 OID 0)
-- Dependencies: 256
-- Name: collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.collection_id_seq OWNED BY public.collection.id;


--
-- TOC entry 315 (class 1259 OID 25302)
-- Name: coupon; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.coupon (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    status boolean DEFAULT true NOT NULL,
    description character varying NOT NULL,
    discount_amount numeric(12,4) NOT NULL,
    free_shipping boolean DEFAULT false NOT NULL,
    discount_type character varying DEFAULT '1'::character varying NOT NULL,
    coupon character varying NOT NULL,
    used_time integer NOT NULL,
    target_products jsonb,
    condition jsonb,
    user_condition jsonb,
    buyx_gety jsonb,
    max_uses_time_per_coupon integer,
    max_uses_time_per_customer integer,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.coupon OWNER TO root;

--
-- TOC entry 314 (class 1259 OID 25301)
-- Name: coupon_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.coupon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coupon_id_seq OWNER TO root;

--
-- TOC entry 4165 (class 0 OID 0)
-- Dependencies: 314
-- Name: coupon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.coupon_id_seq OWNED BY public.coupon.id;


--
-- TOC entry 299 (class 1259 OID 25201)
-- Name: customer; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    status character varying NOT NULL,
    group_id integer,
    email character varying NOT NULL,
    password character varying NOT NULL,
    full_name character varying,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    "groupId" integer
);


ALTER TABLE public.customer OWNER TO root;

--
-- TOC entry 295 (class 1259 OID 25177)
-- Name: customer_address; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.customer_address (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    customer_id integer NOT NULL,
    full_name character varying,
    telephone character varying,
    address_1 character varying,
    address_2 character varying,
    postcode character varying,
    city character varying,
    province character varying,
    country character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    is_default smallint,
    "customerId" integer
);


ALTER TABLE public.customer_address OWNER TO root;

--
-- TOC entry 294 (class 1259 OID 25176)
-- Name: customer_address_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.customer_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_address_id_seq OWNER TO root;

--
-- TOC entry 4166 (class 0 OID 0)
-- Dependencies: 294
-- Name: customer_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.customer_address_id_seq OWNED BY public.customer_address.id;


--
-- TOC entry 297 (class 1259 OID 25189)
-- Name: customer_group; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.customer_group (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    group_name character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.customer_group OWNER TO root;

--
-- TOC entry 296 (class 1259 OID 25188)
-- Name: customer_group_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.customer_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_group_id_seq OWNER TO root;

--
-- TOC entry 4167 (class 0 OID 0)
-- Dependencies: 296
-- Name: customer_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.customer_group_id_seq OWNED BY public.customer_group.id;


--
-- TOC entry 298 (class 1259 OID 25200)
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_id_seq OWNER TO root;

--
-- TOC entry 4168 (class 0 OID 0)
-- Dependencies: 298
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- TOC entry 317 (class 1259 OID 25319)
-- Name: event; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.event (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    data json,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.event OWNER TO root;

--
-- TOC entry 316 (class 1259 OID 25318)
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_id_seq OWNER TO root;

--
-- TOC entry 4169 (class 0 OID 0)
-- Dependencies: 316
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.event_id_seq OWNED BY public.event.id;


--
-- TOC entry 229 (class 1259 OID 24752)
-- Name: forgot_password; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.forgot_password (
    id integer NOT NULL,
    hash character varying NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    "userId" integer
);


ALTER TABLE public.forgot_password OWNER TO root;

--
-- TOC entry 228 (class 1259 OID 24751)
-- Name: forgot_password_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.forgot_password_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.forgot_password_id_seq OWNER TO root;

--
-- TOC entry 4170 (class 0 OID 0)
-- Dependencies: 228
-- Name: forgot_password_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.forgot_password_id_seq OWNED BY public.forgot_password.id;


--
-- TOC entry 325 (class 1259 OID 98992)
-- Name: images; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.images (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_by_user_id integer,
    updated_by_user_id integer,
    account_id integer NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    deleted_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    url text,
    "optimizedUrl" text,
    "fileName" text,
    "fileType" text,
    "fileSize" integer,
    width integer,
    height integer,
    "createdAtImageKit" timestamp without time zone,
    "imageKitId" text,
    resolution text,
    tags text,
    signature text,
    "createdByUserId" integer,
    "updatedByUserId" integer,
    "accountId" integer
);


ALTER TABLE public.images OWNER TO root;

--
-- TOC entry 321 (class 1259 OID 90773)
-- Name: migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO root;

--
-- TOC entry 320 (class 1259 OID 90772)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO root;

--
-- TOC entry 4171 (class 0 OID 0)
-- Dependencies: 320
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 319 (class 1259 OID 70101)
-- Name: migrations_typeorm; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.migrations_typeorm (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations_typeorm OWNER TO root;

--
-- TOC entry 318 (class 1259 OID 70100)
-- Name: migrations_typeorm_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.migrations_typeorm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_typeorm_id_seq OWNER TO root;

--
-- TOC entry 4172 (class 0 OID 0)
-- Dependencies: 318
-- Name: migrations_typeorm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.migrations_typeorm_id_seq OWNED BY public.migrations_typeorm.id;


--
-- TOC entry 289 (class 1259 OID 25140)
-- Name: order; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    integration_order_id character varying,
    sid character varying,
    order_number character varying NOT NULL,
    cart_id integer NOT NULL,
    currency character varying NOT NULL,
    customer_id integer,
    customer_email character varying,
    customer_full_name character varying,
    user_ip character varying,
    user_agent character varying,
    coupon character varying,
    shipping_fee_excl_tax numeric(12,4),
    shipping_fee_incl_tax numeric(12,4),
    discount_amount numeric(12,4),
    sub_total numeric(12,4) NOT NULL,
    sub_total_incl_tax numeric(12,4) NOT NULL,
    total_qty integer NOT NULL,
    total_weight numeric(12,4),
    tax_amount numeric(12,4) NOT NULL,
    shipping_note text,
    grand_total numeric(12,4) NOT NULL,
    shipping_method character varying,
    shipping_method_name character varying,
    shipping_address_id integer,
    payment_method character varying,
    payment_method_name character varying,
    billing_address_id integer,
    shipment_status character varying,
    payment_status character varying,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public."order" OWNER TO root;

--
-- TOC entry 291 (class 1259 OID 25154)
-- Name: order_activity; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.order_activity (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    order_activity_order_id integer NOT NULL,
    comment text NOT NULL,
    customer_notified boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    "orderActivityOrderId" integer
);


ALTER TABLE public.order_activity OWNER TO root;

--
-- TOC entry 290 (class 1259 OID 25153)
-- Name: order_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.order_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_activity_id_seq OWNER TO root;

--
-- TOC entry 4173 (class 0 OID 0)
-- Dependencies: 290
-- Name: order_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.order_activity_id_seq OWNED BY public.order_activity.id;


--
-- TOC entry 293 (class 1259 OID 25167)
-- Name: order_address; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.order_address (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    full_name character varying,
    postcode character varying,
    telephone character varying,
    country character varying,
    province character varying,
    city character varying,
    address_1 character varying,
    address_2 character varying
);


ALTER TABLE public.order_address OWNER TO root;

--
-- TOC entry 292 (class 1259 OID 25166)
-- Name: order_address_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.order_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_address_id_seq OWNER TO root;

--
-- TOC entry 4174 (class 0 OID 0)
-- Dependencies: 292
-- Name: order_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.order_address_id_seq OWNED BY public.order_address.id;


--
-- TOC entry 288 (class 1259 OID 25139)
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_id_seq OWNER TO root;

--
-- TOC entry 4175 (class 0 OID 0)
-- Dependencies: 288
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.order_id_seq OWNED BY public."order".id;


--
-- TOC entry 283 (class 1259 OID 25103)
-- Name: order_item; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.order_item (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    order_item_order_id integer NOT NULL,
    product_id integer NOT NULL,
    referer integer,
    product_sku character varying NOT NULL,
    product_name text NOT NULL,
    thumbnail character varying,
    product_weight numeric(12,4),
    product_price numeric(12,4) NOT NULL,
    product_price_incl_tax numeric(12,4) NOT NULL,
    qty integer NOT NULL,
    final_price numeric(12,4) NOT NULL,
    final_price_incl_tax numeric(12,4) NOT NULL,
    tax_percent numeric(12,4) NOT NULL,
    tax_amount numeric(12,4) NOT NULL,
    discount_amount numeric(12,4) NOT NULL,
    sub_total numeric(12,4) NOT NULL,
    total numeric(12,4) NOT NULL,
    variant_group_id integer,
    variant_options text,
    product_custom_options text,
    requested_data text,
    "orderItemOrderId" integer
);


ALTER TABLE public.order_item OWNER TO root;

--
-- TOC entry 282 (class 1259 OID 25102)
-- Name: order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_item_id_seq OWNER TO root;

--
-- TOC entry 4176 (class 0 OID 0)
-- Dependencies: 282
-- Name: order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.order_item_id_seq OWNED BY public.order_item.id;


--
-- TOC entry 285 (class 1259 OID 25113)
-- Name: payment_transaction; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.payment_transaction (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    payment_transaction_order_id integer NOT NULL,
    transaction_id character varying,
    transaction_type character varying NOT NULL,
    amount numeric(12,4) NOT NULL,
    parent_transaction_id character varying,
    payment_action character varying,
    additional_information text,
    created_at timestamp with time zone DEFAULT now(),
    "paymentTransactionOrderId" integer
);


ALTER TABLE public.payment_transaction OWNER TO root;

--
-- TOC entry 284 (class 1259 OID 25112)
-- Name: payment_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.payment_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_transaction_id_seq OWNER TO root;

--
-- TOC entry 4177 (class 0 OID 0)
-- Dependencies: 284
-- Name: payment_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.payment_transaction_id_seq OWNED BY public.payment_transaction.id;


--
-- TOC entry 243 (class 1259 OID 24839)
-- Name: product_attribute; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.product_attribute (
    product_attribute_value_index_id integer NOT NULL,
    "attributeId" integer,
    "optionId" integer,
    "productId" integer,
    text text
);


ALTER TABLE public.product_attribute OWNER TO root;

--
-- TOC entry 242 (class 1259 OID 24838)
-- Name: product_attribute_product_attribute_value_index_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.product_attribute_product_attribute_value_index_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_attribute_product_attribute_value_index_id_seq OWNER TO root;

--
-- TOC entry 4178 (class 0 OID 0)
-- Dependencies: 242
-- Name: product_attribute_product_attribute_value_index_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.product_attribute_product_attribute_value_index_id_seq OWNED BY public.product_attribute.product_attribute_value_index_id;


--
-- TOC entry 259 (class 1259 OID 24958)
-- Name: product_collection; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.product_collection (
    id integer NOT NULL,
    collection_id integer NOT NULL,
    product_id integer NOT NULL,
    "collectionId" integer,
    "productId" integer
);


ALTER TABLE public.product_collection OWNER TO root;

--
-- TOC entry 258 (class 1259 OID 24957)
-- Name: product_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.product_collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_collection_id_seq OWNER TO root;

--
-- TOC entry 4179 (class 0 OID 0)
-- Dependencies: 258
-- Name: product_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.product_collection_id_seq OWNED BY public.product_collection.id;


--
-- TOC entry 263 (class 1259 OID 24979)
-- Name: product_custom_option; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.product_custom_option (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    product_custom_option_product_id integer NOT NULL,
    option_name character varying NOT NULL,
    option_type character varying NOT NULL,
    is_required boolean DEFAULT false NOT NULL,
    sort_order integer,
    "productCustomOptionProductId" integer
);


ALTER TABLE public.product_custom_option OWNER TO root;

--
-- TOC entry 262 (class 1259 OID 24978)
-- Name: product_custom_option_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.product_custom_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_custom_option_id_seq OWNER TO root;

--
-- TOC entry 4180 (class 0 OID 0)
-- Dependencies: 262
-- Name: product_custom_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.product_custom_option_id_seq OWNED BY public.product_custom_option.id;


--
-- TOC entry 261 (class 1259 OID 24969)
-- Name: product_custom_option_value; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.product_custom_option_value (
    product_custom_option_value_id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    option_id integer NOT NULL,
    extra_price numeric(12,4),
    sort_order integer,
    value character varying NOT NULL,
    "optionId" integer
);


ALTER TABLE public.product_custom_option_value OWNER TO root;

--
-- TOC entry 260 (class 1259 OID 24968)
-- Name: product_custom_option_value_product_custom_option_value_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.product_custom_option_value_product_custom_option_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_custom_option_value_product_custom_option_value_id_seq OWNER TO root;

--
-- TOC entry 4181 (class 0 OID 0)
-- Dependencies: 260
-- Name: product_custom_option_value_product_custom_option_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.product_custom_option_value_product_custom_option_value_id_seq OWNED BY public.product_custom_option_value.product_custom_option_value_id;


--
-- TOC entry 265 (class 1259 OID 24990)
-- Name: product_description; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.product_description (
    id integer NOT NULL,
    product_description_product_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    short_description text,
    url_key character varying NOT NULL,
    meta_title text,
    meta_description text,
    meta_keywords text
);


ALTER TABLE public.product_description OWNER TO root;

--
-- TOC entry 264 (class 1259 OID 24989)
-- Name: product_description_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.product_description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_description_id_seq OWNER TO root;

--
-- TOC entry 4182 (class 0 OID 0)
-- Dependencies: 264
-- Name: product_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.product_description_id_seq OWNED BY public.product_description.id;


--
-- TOC entry 267 (class 1259 OID 25003)
-- Name: product_inventory; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.product_inventory (
    id integer NOT NULL,
    product_inventory_product_id integer NOT NULL,
    qty integer DEFAULT 0 NOT NULL,
    manage_stock boolean DEFAULT false NOT NULL,
    stock_availability boolean DEFAULT false NOT NULL
);


ALTER TABLE public.product_inventory OWNER TO root;

--
-- TOC entry 266 (class 1259 OID 25002)
-- Name: product_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.product_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_inventory_id_seq OWNER TO root;

--
-- TOC entry 4183 (class 0 OID 0)
-- Dependencies: 266
-- Name: product_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.product_inventory_id_seq OWNED BY public.product_inventory.id;


--
-- TOC entry 273 (class 1259 OID 25043)
-- Name: products; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    price numeric(10,2) NOT NULL,
    tags character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL,
    update_at timestamp without time zone DEFAULT now() NOT NULL,
    delete_at timestamp without time zone,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    type character varying DEFAULT 'simple'::character varying NOT NULL,
    variant_group_id integer,
    visibility boolean DEFAULT true NOT NULL,
    group_id integer,
    sku character varying NOT NULL,
    weight numeric(12,4),
    status boolean DEFAULT false NOT NULL,
    "categoryId" integer,
    "groupId" integer,
    "taxClassId" integer,
    "variantGroupId" integer,
    discount numeric(10,2) NOT NULL,
    rating numeric DEFAULT '0'::numeric NOT NULL,
    "numReviews" numeric DEFAULT '0'::numeric NOT NULL
);


ALTER TABLE public.products OWNER TO root;

--
-- TOC entry 272 (class 1259 OID 25042)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO root;

--
-- TOC entry 4184 (class 0 OID 0)
-- Dependencies: 272
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 301 (class 1259 OID 25215)
-- Name: reset_password_token; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.reset_password_token (
    id integer NOT NULL,
    token text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    "customerId" integer
);


ALTER TABLE public.reset_password_token OWNER TO root;

--
-- TOC entry 300 (class 1259 OID 25214)
-- Name: reset_password_token_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.reset_password_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reset_password_token_id_seq OWNER TO root;

--
-- TOC entry 4185 (class 0 OID 0)
-- Dependencies: 300
-- Name: reset_password_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.reset_password_token_id_seq OWNED BY public.reset_password_token.id;


--
-- TOC entry 323 (class 1259 OID 90782)
-- Name: seeds; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.seeds (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.seeds OWNER TO root;

--
-- TOC entry 322 (class 1259 OID 90781)
-- Name: seeds_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.seeds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seeds_id_seq OWNER TO root;

--
-- TOC entry 4186 (class 0 OID 0)
-- Dependencies: 322
-- Name: seeds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.seeds_id_seq OWNED BY public.seeds.id;


--
-- TOC entry 303 (class 1259 OID 25225)
-- Name: setting; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.setting (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    value text,
    is_json boolean DEFAULT false NOT NULL
);


ALTER TABLE public.setting OWNER TO root;

--
-- TOC entry 302 (class 1259 OID 25224)
-- Name: setting_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.setting_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.setting_id_seq OWNER TO root;

--
-- TOC entry 4187 (class 0 OID 0)
-- Dependencies: 302
-- Name: setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.setting_id_seq OWNED BY public.setting.id;


--
-- TOC entry 287 (class 1259 OID 25128)
-- Name: shipment; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.shipment (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    shipment_order_id integer NOT NULL,
    carrier character varying,
    tracking_number character varying,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    "shipmentOrderId" integer
);


ALTER TABLE public.shipment OWNER TO root;

--
-- TOC entry 286 (class 1259 OID 25127)
-- Name: shipment_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.shipment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shipment_id_seq OWNER TO root;

--
-- TOC entry 4188 (class 0 OID 0)
-- Dependencies: 286
-- Name: shipment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.shipment_id_seq OWNED BY public.shipment.id;


--
-- TOC entry 233 (class 1259 OID 24772)
-- Name: shipping_method; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.shipping_method (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.shipping_method OWNER TO root;

--
-- TOC entry 232 (class 1259 OID 24771)
-- Name: shipping_method_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.shipping_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shipping_method_id_seq OWNER TO root;

--
-- TOC entry 4189 (class 0 OID 0)
-- Dependencies: 232
-- Name: shipping_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.shipping_method_id_seq OWNED BY public.shipping_method.id;


--
-- TOC entry 239 (class 1259 OID 24810)
-- Name: shipping_zone; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.shipping_zone (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    country character varying NOT NULL
);


ALTER TABLE public.shipping_zone OWNER TO root;

--
-- TOC entry 238 (class 1259 OID 24809)
-- Name: shipping_zone_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.shipping_zone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shipping_zone_id_seq OWNER TO root;

--
-- TOC entry 4190 (class 0 OID 0)
-- Dependencies: 238
-- Name: shipping_zone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.shipping_zone_id_seq OWNED BY public.shipping_zone.id;


--
-- TOC entry 235 (class 1259 OID 24784)
-- Name: shipping_zone_method; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.shipping_zone_method (
    id integer NOT NULL,
    method_id integer NOT NULL,
    zone_id integer NOT NULL,
    is_enabled boolean DEFAULT true NOT NULL,
    cost numeric(12,4),
    calculate_api character varying,
    condition_type character varying,
    max numeric(12,4),
    min numeric(12,4),
    "methodId" integer,
    "zoneId" integer
);


ALTER TABLE public.shipping_zone_method OWNER TO root;

--
-- TOC entry 234 (class 1259 OID 24783)
-- Name: shipping_zone_method_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.shipping_zone_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shipping_zone_method_id_seq OWNER TO root;

--
-- TOC entry 4191 (class 0 OID 0)
-- Dependencies: 234
-- Name: shipping_zone_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.shipping_zone_method_id_seq OWNED BY public.shipping_zone_method.id;


--
-- TOC entry 237 (class 1259 OID 24798)
-- Name: shipping_zone_province; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.shipping_zone_province (
    shipping_zone_province_id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    zone_id integer NOT NULL,
    province character varying NOT NULL,
    "zoneId" integer
);


ALTER TABLE public.shipping_zone_province OWNER TO root;

--
-- TOC entry 236 (class 1259 OID 24797)
-- Name: shipping_zone_province_shipping_zone_province_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.shipping_zone_province_shipping_zone_province_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shipping_zone_province_shipping_zone_province_id_seq OWNER TO root;

--
-- TOC entry 4192 (class 0 OID 0)
-- Dependencies: 236
-- Name: shipping_zone_province_shipping_zone_province_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.shipping_zone_province_shipping_zone_province_id_seq OWNED BY public.shipping_zone_province.shipping_zone_province_id;


--
-- TOC entry 223 (class 1259 OID 24725)
-- Name: stores; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.stores (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.stores OWNER TO root;

--
-- TOC entry 222 (class 1259 OID 24724)
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.stores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stores_id_seq OWNER TO root;

--
-- TOC entry 4193 (class 0 OID 0)
-- Dependencies: 222
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.stores_id_seq OWNED BY public.stores.id;


--
-- TOC entry 271 (class 1259 OID 25033)
-- Name: tax_class; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.tax_class (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.tax_class OWNER TO root;

--
-- TOC entry 270 (class 1259 OID 25032)
-- Name: tax_class_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.tax_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tax_class_id_seq OWNER TO root;

--
-- TOC entry 4194 (class 0 OID 0)
-- Dependencies: 270
-- Name: tax_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.tax_class_id_seq OWNED BY public.tax_class.id;


--
-- TOC entry 269 (class 1259 OID 25015)
-- Name: tax_rate; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.tax_rate (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    tax_class_id integer,
    country character varying DEFAULT '*'::character varying NOT NULL,
    province character varying DEFAULT '*'::character varying NOT NULL,
    postcode character varying DEFAULT '*'::character varying NOT NULL,
    rate numeric(12,4) NOT NULL,
    is_compound boolean DEFAULT false NOT NULL,
    priority integer NOT NULL,
    "taxClassId" integer
);


ALTER TABLE public.tax_rate OWNER TO root;

--
-- TOC entry 268 (class 1259 OID 25014)
-- Name: tax_rate_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.tax_rate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tax_rate_id_seq OWNER TO root;

--
-- TOC entry 4195 (class 0 OID 0)
-- Dependencies: 268
-- Name: tax_rate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.tax_rate_id_seq OWNED BY public.tax_rate.id;


--
-- TOC entry 305 (class 1259 OID 25238)
-- Name: url_rewrite; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.url_rewrite (
    id integer NOT NULL,
    language character varying DEFAULT 'en'::character varying NOT NULL,
    request_path character varying NOT NULL,
    target_path character varying NOT NULL,
    entity_uuid uuid,
    entity_type character varying
);


ALTER TABLE public.url_rewrite OWNER TO root;

--
-- TOC entry 304 (class 1259 OID 25237)
-- Name: url_rewrite_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.url_rewrite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.url_rewrite_id_seq OWNER TO root;

--
-- TOC entry 4196 (class 0 OID 0)
-- Dependencies: 304
-- Name: url_rewrite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.url_rewrite_id_seq OWNED BY public.url_rewrite.id;


--
-- TOC entry 217 (class 1259 OID 24684)
-- Name: user; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying,
    nickname character varying,
    password character varying,
    provider character varying DEFAULT 'email'::character varying NOT NULL,
    status public.user_status_enum DEFAULT 'inactive'::public.user_status_enum NOT NULL,
    "socialId" character varying,
    "firstName" character varying,
    "lastName" character varying,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    hash character varying,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."user" OWNER TO root;

--
-- TOC entry 216 (class 1259 OID 24683)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO root;

--
-- TOC entry 4197 (class 0 OID 0)
-- Dependencies: 216
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 247 (class 1259 OID 24862)
-- Name: variant_group; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.variant_group (
    id integer NOT NULL,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    attribute_group_id integer NOT NULL,
    attribute_one integer,
    attribute_two integer,
    attribute_three integer,
    attribute_four integer,
    attribute_five integer,
    visibility boolean DEFAULT false NOT NULL,
    "attributeFive2Id" integer,
    "attributeFour2Id" integer,
    "attributeGroupId" integer,
    "attributeOne2Id" integer,
    "attributeThree2Id" integer,
    "attributeTwo2Id" integer
);


ALTER TABLE public.variant_group OWNER TO root;

--
-- TOC entry 246 (class 1259 OID 24861)
-- Name: variant_group_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.variant_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.variant_group_id_seq OWNER TO root;

--
-- TOC entry 4198 (class 0 OID 0)
-- Dependencies: 246
-- Name: variant_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.variant_group_id_seq OWNED BY public.variant_group.id;


--
-- TOC entry 3506 (class 2604 OID 24718)
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- TOC entry 3512 (class 2604 OID 24744)
-- Name: accounts_counter_settings id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.accounts_counter_settings ALTER COLUMN id SET DEFAULT nextval('public.accounts_counter_settings_id_seq'::regclass);


--
-- TOC entry 3511 (class 2604 OID 24737)
-- Name: accounts_stores id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.accounts_stores ALTER COLUMN id SET DEFAULT nextval('public.accounts_stores_id_seq'::regclass);


--
-- TOC entry 3498 (class 2604 OID 24702)
-- Name: accounts_users id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.accounts_users ALTER COLUMN id SET DEFAULT nextval('public.accounts_users_id_seq'::regclass);


--
-- TOC entry 3640 (class 2604 OID 25265)
-- Name: admin_user id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.admin_user ALTER COLUMN id SET DEFAULT nextval('public.admin_user_id_seq'::regclass);


--
-- TOC entry 3517 (class 2604 OID 24765)
-- Name: app_session id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.app_session ALTER COLUMN id SET DEFAULT nextval('public.app_session_id_seq'::regclass);


--
-- TOC entry 3538 (class 2604 OID 24874)
-- Name: attribute id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.attribute ALTER COLUMN id SET DEFAULT nextval('public.attribute_id_seq'::regclass);


--
-- TOC entry 3543 (class 2604 OID 24900)
-- Name: attribute_group id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.attribute_group ALTER COLUMN id SET DEFAULT nextval('public.attribute_group_id_seq'::regclass);


--
-- TOC entry 3533 (class 2604 OID 24855)
-- Name: attribute_option id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.attribute_option ALTER COLUMN id SET DEFAULT nextval('public.attribute_option_id_seq'::regclass);


--
-- TOC entry 3527 (class 2604 OID 24829)
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- TOC entry 3638 (class 2604 OID 25255)
-- Name: cart_address id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cart_address ALTER COLUMN id SET DEFAULT nextval('public.cart_address_id_seq'::regclass);


--
-- TOC entry 3585 (class 2604 OID 25064)
-- Name: cart_item id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cart_item ALTER COLUMN id SET DEFAULT nextval('public.cart_item_id_seq'::regclass);


--
-- TOC entry 3589 (class 2604 OID 25076)
-- Name: catalog_classes id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.catalog_classes ALTER COLUMN id SET DEFAULT nextval('public.catalog_classes_id_seq'::regclass);


--
-- TOC entry 3592 (class 2604 OID 25085)
-- Name: catalog_types id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.catalog_types ALTER COLUMN id SET DEFAULT nextval('public.catalog_types_id_seq'::regclass);


--
-- TOC entry 3595 (class 2604 OID 25094)
-- Name: catalogs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.catalogs ALTER COLUMN id SET DEFAULT nextval('public.catalogs_id_seq'::regclass);


--
-- TOC entry 3548 (class 2604 OID 24925)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3547 (class 2604 OID 24912)
-- Name: category_description id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.category_description ALTER COLUMN id SET DEFAULT nextval('public.category_description_id_seq'::regclass);


--
-- TOC entry 3646 (class 2604 OID 25293)
-- Name: cms_page id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cms_page ALTER COLUMN id SET DEFAULT nextval('public.cms_page_id_seq'::regclass);


--
-- TOC entry 3645 (class 2604 OID 25280)
-- Name: cms_page_description id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cms_page_description ALTER COLUMN id SET DEFAULT nextval('public.cms_page_description_id_seq'::regclass);


--
-- TOC entry 3552 (class 2604 OID 24947)
-- Name: collection id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.collection ALTER COLUMN id SET DEFAULT nextval('public.collection_id_seq'::regclass);


--
-- TOC entry 3650 (class 2604 OID 25305)
-- Name: coupon id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.coupon ALTER COLUMN id SET DEFAULT nextval('public.coupon_id_seq'::regclass);


--
-- TOC entry 3627 (class 2604 OID 25204)
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- TOC entry 3619 (class 2604 OID 25180)
-- Name: customer_address id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.customer_address ALTER COLUMN id SET DEFAULT nextval('public.customer_address_id_seq'::regclass);


--
-- TOC entry 3623 (class 2604 OID 25192)
-- Name: customer_group id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.customer_group ALTER COLUMN id SET DEFAULT nextval('public.customer_group_id_seq'::regclass);


--
-- TOC entry 3657 (class 2604 OID 25322)
-- Name: event id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.event ALTER COLUMN id SET DEFAULT nextval('public.event_id_seq'::regclass);


--
-- TOC entry 3515 (class 2604 OID 24755)
-- Name: forgot_password id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.forgot_password ALTER COLUMN id SET DEFAULT nextval('public.forgot_password_id_seq'::regclass);


--
-- TOC entry 3661 (class 2604 OID 90776)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3660 (class 2604 OID 70104)
-- Name: migrations_typeorm id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migrations_typeorm ALTER COLUMN id SET DEFAULT nextval('public.migrations_typeorm_id_seq'::regclass);


--
-- TOC entry 3608 (class 2604 OID 25143)
-- Name: order id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."order" ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);


--
-- TOC entry 3612 (class 2604 OID 25157)
-- Name: order_activity id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.order_activity ALTER COLUMN id SET DEFAULT nextval('public.order_activity_id_seq'::regclass);


--
-- TOC entry 3617 (class 2604 OID 25170)
-- Name: order_address id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.order_address ALTER COLUMN id SET DEFAULT nextval('public.order_address_id_seq'::regclass);


--
-- TOC entry 3599 (class 2604 OID 25106)
-- Name: order_item id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.order_item ALTER COLUMN id SET DEFAULT nextval('public.order_item_id_seq'::regclass);


--
-- TOC entry 3601 (class 2604 OID 25116)
-- Name: payment_transaction id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.payment_transaction ALTER COLUMN id SET DEFAULT nextval('public.payment_transaction_id_seq'::regclass);


--
-- TOC entry 3532 (class 2604 OID 24842)
-- Name: product_attribute product_attribute_value_index_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_attribute ALTER COLUMN product_attribute_value_index_id SET DEFAULT nextval('public.product_attribute_product_attribute_value_index_id_seq'::regclass);


--
-- TOC entry 3556 (class 2604 OID 24961)
-- Name: product_collection id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_collection ALTER COLUMN id SET DEFAULT nextval('public.product_collection_id_seq'::regclass);


--
-- TOC entry 3559 (class 2604 OID 24982)
-- Name: product_custom_option id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_custom_option ALTER COLUMN id SET DEFAULT nextval('public.product_custom_option_id_seq'::regclass);


--
-- TOC entry 3557 (class 2604 OID 24972)
-- Name: product_custom_option_value product_custom_option_value_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_custom_option_value ALTER COLUMN product_custom_option_value_id SET DEFAULT nextval('public.product_custom_option_value_product_custom_option_value_id_seq'::regclass);


--
-- TOC entry 3562 (class 2604 OID 24993)
-- Name: product_description id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_description ALTER COLUMN id SET DEFAULT nextval('public.product_description_id_seq'::regclass);


--
-- TOC entry 3563 (class 2604 OID 25006)
-- Name: product_inventory id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_inventory ALTER COLUMN id SET DEFAULT nextval('public.product_inventory_id_seq'::regclass);


--
-- TOC entry 3575 (class 2604 OID 25046)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3631 (class 2604 OID 25218)
-- Name: reset_password_token id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reset_password_token ALTER COLUMN id SET DEFAULT nextval('public.reset_password_token_id_seq'::regclass);


--
-- TOC entry 3662 (class 2604 OID 90785)
-- Name: seeds id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.seeds ALTER COLUMN id SET DEFAULT nextval('public.seeds_id_seq'::regclass);


--
-- TOC entry 3633 (class 2604 OID 25228)
-- Name: setting id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.setting ALTER COLUMN id SET DEFAULT nextval('public.setting_id_seq'::regclass);


--
-- TOC entry 3604 (class 2604 OID 25131)
-- Name: shipment id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shipment ALTER COLUMN id SET DEFAULT nextval('public.shipment_id_seq'::regclass);


--
-- TOC entry 3519 (class 2604 OID 24775)
-- Name: shipping_method id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shipping_method ALTER COLUMN id SET DEFAULT nextval('public.shipping_method_id_seq'::regclass);


--
-- TOC entry 3525 (class 2604 OID 24813)
-- Name: shipping_zone id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shipping_zone ALTER COLUMN id SET DEFAULT nextval('public.shipping_zone_id_seq'::regclass);


--
-- TOC entry 3521 (class 2604 OID 24787)
-- Name: shipping_zone_method id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shipping_zone_method ALTER COLUMN id SET DEFAULT nextval('public.shipping_zone_method_id_seq'::regclass);


--
-- TOC entry 3523 (class 2604 OID 24801)
-- Name: shipping_zone_province shipping_zone_province_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shipping_zone_province ALTER COLUMN shipping_zone_province_id SET DEFAULT nextval('public.shipping_zone_province_shipping_zone_province_id_seq'::regclass);


--
-- TOC entry 3510 (class 2604 OID 24728)
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);


--
-- TOC entry 3573 (class 2604 OID 25036)
-- Name: tax_class id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tax_class ALTER COLUMN id SET DEFAULT nextval('public.tax_class_id_seq'::regclass);


--
-- TOC entry 3567 (class 2604 OID 25018)
-- Name: tax_rate id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tax_rate ALTER COLUMN id SET DEFAULT nextval('public.tax_rate_id_seq'::regclass);


--
-- TOC entry 3636 (class 2604 OID 25241)
-- Name: url_rewrite id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.url_rewrite ALTER COLUMN id SET DEFAULT nextval('public.url_rewrite_id_seq'::regclass);


--
-- TOC entry 3493 (class 2604 OID 24687)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 3535 (class 2604 OID 24865)
-- Name: variant_group id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.variant_group ALTER COLUMN id SET DEFAULT nextval('public.variant_group_id_seq'::regclass);


--
-- TOC entry 4034 (class 0 OID 24715)
-- Dependencies: 221
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.accounts (id, create_at, is_active, update_at, name) FROM stdin;
77	2024-11-30 00:23:10.696	t	2024-12-22 21:53:56.136956	\N
78	2024-11-30 09:08:20.094	t	2024-12-22 21:53:56.136956	\N
79	2024-11-30 02:26:11.102	t	2024-12-22 21:53:56.136956	\N
80	2024-11-29 19:37:20.26	t	2024-12-22 21:53:56.136956	\N
81	2024-11-30 05:20:30.676	t	2024-12-22 21:53:56.136956	\N
82	2024-11-30 17:45:59.276	t	2024-12-22 21:53:56.136956	\N
\.


--
-- TOC entry 4040 (class 0 OID 24741)
-- Dependencies: 227
-- Data for Name: accounts_counter_settings; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.accounts_counter_settings (id, type, current_count, initial_count, created_at, updated_at, "accountId", "createdByUserId", "updatedByUserId") FROM stdin;
\.


--
-- TOC entry 4038 (class 0 OID 24734)
-- Dependencies: 225
-- Data for Name: accounts_stores; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.accounts_stores (id, "accountId", "storeId") FROM stdin;
\.


--
-- TOC entry 4032 (class 0 OID 24699)
-- Dependencies: 219
-- Data for Name: accounts_users; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.accounts_users (id, create_at, update_at, is_owner, is_active, decimals_separator, thousands_separator, lang, "accountId", "userId") FROM stdin;
\.


--
-- TOC entry 4122 (class 0 OID 25262)
-- Dependencies: 309
-- Data for Name: admin_user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.admin_user (id, uuid, status, email, password, full_name, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4044 (class 0 OID 24762)
-- Dependencies: 231
-- Data for Name: app_session; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.app_session (id, sid, sess, expire, "createdAt", "deletedAt", "userId") FROM stdin;
1	1	{"userId":1,"accountId":1,"storeId":1}	2024-05-11 11:31:08.563	2024-05-11 16:31:08.569668	\N	1
2	1	{"userId":1,"accountId":1,"storeId":1}	2024-05-11 12:27:08.214	2024-05-11 17:27:08.214763	\N	1
3	1	{"userId":1,"accountId":1,"storeId":1}	2024-05-11 12:37:04.111	2024-05-11 17:37:04.12131	\N	1
4	1	{"userId":1,"accountId":1,"storeId":1}	2024-05-12 14:26:33.617	2024-05-12 19:26:33.61833	\N	1
\.


--
-- TOC entry 4062 (class 0 OID 24871)
-- Dependencies: 249
-- Data for Name: attribute; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.attribute (id, uuid, type, is_required, display_on_frontend, sort_order, is_filterable, code, name) FROM stdin;
77	d6219058-989a-4cf4-9207-000243afa0bc	text	f	f	1	f	lizeth	lizeth
78	48915e13-23db-4b0e-89a8-9a40d64d4826	select	f	f	1	f	lizeth2	lizeth
79	b4a3b8a5-14c3-4fd3-a4f5-aadae166d62f	select	f	f	1	f	333	333
81	15dd3184-01b9-48fa-a260-17ed7bb9dff8	select	f	f	1	f	3333	333
75	f967c9b9-ac93-4aab-b862-b7cae7bfafb3	select	f	f	1	f	5555	Size
76	37221d3e-9a44-4e7d-ab9d-5de921b08509	select	f	f	1	f	77777	Size
82	914cc844-3259-42d4-a47a-5007f8883742	text	t	f	1	t	222	amir
104	e20afba2-f044-4b72-ac59-c936c52a2333	textarea	f	f	1	f	334	limite
110	2ad65d4c-6dd6-4ccb-9c3b-2c1d5c195c1d	textarea	f	f	1	f	nuevo	nuevo
109	7e65929e-ca00-4cc5-9432-f53b641ac920	text	f	f	1	f	33335	Amir
\.


--
-- TOC entry 4064 (class 0 OID 24897)
-- Dependencies: 251
-- Data for Name: attribute_group; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.attribute_group (id, uuid, group_name, created_at, updated_at) FROM stdin;
18	9da336f3-9241-402b-a12f-66e18362954f	ropa	2024-11-27 20:05:50.858448+00	2024-11-27 20:05:50.858448+00
19	9fde893a-3933-4fa3-bf03-cf5606ef474f	tela	2024-12-22 22:01:06.156162+00	2024-12-22 22:01:06.156162+00
\.


--
-- TOC entry 4137 (class 0 OID 98972)
-- Dependencies: 324
-- Data for Name: attribute_groups_attribute_group; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.attribute_groups_attribute_group ("attributeId", "attributeGroupId") FROM stdin;
76	18
76	19
82	18
104	18
109	18
110	19
\.


--
-- TOC entry 4058 (class 0 OID 24852)
-- Dependencies: 245
-- Data for Name: attribute_option; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.attribute_option (id, uuid, "attributeId", code, text) FROM stdin;
9	b13f5ff5-6221-420c-b915-d935b9268218	78	222	nueve
6	7f234422-76fa-410f-af98-e932ab0602cc	\N	22	XL
7	d1d5f509-62ce-4628-8a74-09c2057e233e	\N	1	XL
8	f9779864-f3e0-4b62-9c52-9649c31e1293	\N	2	SM
10	7c0f1ddb-25d4-446b-99e7-4dc90b427f80	\N	3	XL
12	bbaac7b4-2f03-4844-a7c1-02249c70ea37	76	4	sm
11	c0fa1dbd-0ce7-442b-8a29-cb8dead85ad9	76	111	amilx
\.


--
-- TOC entry 4054 (class 0 OID 24826)
-- Dependencies: 241
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.cart (id, uuid, sid, currency, customer_id, customer_group_id, customer_email, customer_full_name, user_ip, status, coupon, shipping_fee_excl_tax, shipping_fee_incl_tax, discount_amount, sub_total, sub_total_incl_tax, total_qty, total_weight, tax_amount, grand_total, shipping_method, shipping_method_name, shipping_zone_id, shipping_address_id, payment_method, payment_method_name, billing_address_id, shipping_note, created_at, updated_at, "shippingZoneId") FROM stdin;
\.


--
-- TOC entry 4120 (class 0 OID 25252)
-- Dependencies: 307
-- Data for Name: cart_address; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.cart_address (id, uuid, full_name, postcode, telephone, country, province, city, address_1, address_2) FROM stdin;
\.


--
-- TOC entry 4088 (class 0 OID 25061)
-- Dependencies: 275
-- Data for Name: cart_item; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.cart_item (id, uuid, cart_id, product_id, product_sku, product_name, thumbnail, product_weight, product_price, product_price_incl_tax, qty, final_price, final_price_incl_tax, tax_percent, tax_amount, discount_amount, sub_total, total, variant_group_id, variant_options, product_custom_options, created_at, updated_at, "cartId", "productId") FROM stdin;
\.


--
-- TOC entry 4090 (class 0 OID 25073)
-- Dependencies: 277
-- Data for Name: catalog_classes; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.catalog_classes (id, create_at, update_at, name, description) FROM stdin;
\.


--
-- TOC entry 4092 (class 0 OID 25082)
-- Dependencies: 279
-- Data for Name: catalog_types; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.catalog_types (id, create_at, update_at, name, description, catalog_class_id) FROM stdin;
\.


--
-- TOC entry 4094 (class 0 OID 25091)
-- Dependencies: 281
-- Data for Name: catalogs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.catalogs (id, create_at, update_at, name, description, is_active, custom_properties, catalog_type_id, parent_catalog_id) FROM stdin;
\.


--
-- TOC entry 4068 (class 0 OID 24922)
-- Dependencies: 255
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.category (id, uuid, status, parent_id, include_in_nav, "position", created_at, updated_at, name, image) FROM stdin;
\.


--
-- TOC entry 4066 (class 0 OID 24909)
-- Dependencies: 253
-- Data for Name: category_description; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.category_description (id, category_description_category_id, name, short_description, description, image, meta_title, meta_keywords, meta_description, url_key) FROM stdin;
\.


--
-- TOC entry 4126 (class 0 OID 25290)
-- Dependencies: 313
-- Data for Name: cms_page; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.cms_page (id, uuid, layout, status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4124 (class 0 OID 25277)
-- Dependencies: 311
-- Data for Name: cms_page_description; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.cms_page_description (id, cms_page_description_cms_page_id, url_key, name, content, meta_title, meta_keywords, meta_description) FROM stdin;
\.


--
-- TOC entry 4070 (class 0 OID 24944)
-- Dependencies: 257
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.collection (id, uuid, name, description, code, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4128 (class 0 OID 25302)
-- Dependencies: 315
-- Data for Name: coupon; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.coupon (id, uuid, status, description, discount_amount, free_shipping, discount_type, coupon, used_time, target_products, condition, user_condition, buyx_gety, max_uses_time_per_coupon, max_uses_time_per_customer, start_date, end_date, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4112 (class 0 OID 25201)
-- Dependencies: 299
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.customer (id, uuid, status, group_id, email, password, full_name, created_at, updated_at, "groupId") FROM stdin;
\.


--
-- TOC entry 4108 (class 0 OID 25177)
-- Dependencies: 295
-- Data for Name: customer_address; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.customer_address (id, uuid, customer_id, full_name, telephone, address_1, address_2, postcode, city, province, country, created_at, updated_at, is_default, "customerId") FROM stdin;
\.


--
-- TOC entry 4110 (class 0 OID 25189)
-- Dependencies: 297
-- Data for Name: customer_group; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.customer_group (id, uuid, group_name, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4130 (class 0 OID 25319)
-- Dependencies: 317
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.event (id, uuid, name, data, created_at) FROM stdin;
\.


--
-- TOC entry 4042 (class 0 OID 24752)
-- Dependencies: 229
-- Data for Name: forgot_password; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.forgot_password (id, hash, "createdAt", "deletedAt", "userId") FROM stdin;
\.


--
-- TOC entry 4138 (class 0 OID 98992)
-- Dependencies: 325
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.images (id, created_by_user_id, updated_by_user_id, account_id, is_active, deleted_at, created_at, updated_at, url, "optimizedUrl", "fileName", "fileType", "fileSize", width, height, "createdAtImageKit", "imageKitId", resolution, tags, signature, "createdByUserId", "updatedByUserId", "accountId") FROM stdin;
\.


--
-- TOC entry 4134 (class 0 OID 90773)
-- Dependencies: 321
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
\.


--
-- TOC entry 4132 (class 0 OID 70101)
-- Dependencies: 319
-- Data for Name: migrations_typeorm; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.migrations_typeorm (id, "timestamp", name) FROM stdin;
1	1731812770951	Adjust1731812770951
3	1734904389072	AttributeGroupLinkUnique1734904389072
4	1735429155671	Imagekit1735429155671
\.


--
-- TOC entry 4102 (class 0 OID 25140)
-- Dependencies: 289
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."order" (id, uuid, integration_order_id, sid, order_number, cart_id, currency, customer_id, customer_email, customer_full_name, user_ip, user_agent, coupon, shipping_fee_excl_tax, shipping_fee_incl_tax, discount_amount, sub_total, sub_total_incl_tax, total_qty, total_weight, tax_amount, shipping_note, grand_total, shipping_method, shipping_method_name, shipping_address_id, payment_method, payment_method_name, billing_address_id, shipment_status, payment_status, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4104 (class 0 OID 25154)
-- Dependencies: 291
-- Data for Name: order_activity; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.order_activity (id, uuid, order_activity_order_id, comment, customer_notified, created_at, updated_at, "orderActivityOrderId") FROM stdin;
\.


--
-- TOC entry 4106 (class 0 OID 25167)
-- Dependencies: 293
-- Data for Name: order_address; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.order_address (id, uuid, full_name, postcode, telephone, country, province, city, address_1, address_2) FROM stdin;
\.


--
-- TOC entry 4096 (class 0 OID 25103)
-- Dependencies: 283
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.order_item (id, uuid, order_item_order_id, product_id, referer, product_sku, product_name, thumbnail, product_weight, product_price, product_price_incl_tax, qty, final_price, final_price_incl_tax, tax_percent, tax_amount, discount_amount, sub_total, total, variant_group_id, variant_options, product_custom_options, requested_data, "orderItemOrderId") FROM stdin;
\.


--
-- TOC entry 4098 (class 0 OID 25113)
-- Dependencies: 285
-- Data for Name: payment_transaction; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.payment_transaction (id, uuid, payment_transaction_order_id, transaction_id, transaction_type, amount, parent_transaction_id, payment_action, additional_information, created_at, "paymentTransactionOrderId") FROM stdin;
\.


--
-- TOC entry 4056 (class 0 OID 24839)
-- Dependencies: 243
-- Data for Name: product_attribute; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.product_attribute (product_attribute_value_index_id, "attributeId", "optionId", "productId", text) FROM stdin;
\.


--
-- TOC entry 4072 (class 0 OID 24958)
-- Dependencies: 259
-- Data for Name: product_collection; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.product_collection (id, collection_id, product_id, "collectionId", "productId") FROM stdin;
\.


--
-- TOC entry 4076 (class 0 OID 24979)
-- Dependencies: 263
-- Data for Name: product_custom_option; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.product_custom_option (id, uuid, product_custom_option_product_id, option_name, option_type, is_required, sort_order, "productCustomOptionProductId") FROM stdin;
\.


--
-- TOC entry 4074 (class 0 OID 24969)
-- Dependencies: 261
-- Data for Name: product_custom_option_value; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.product_custom_option_value (product_custom_option_value_id, uuid, option_id, extra_price, sort_order, value, "optionId") FROM stdin;
\.


--
-- TOC entry 4078 (class 0 OID 24990)
-- Dependencies: 265
-- Data for Name: product_description; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.product_description (id, product_description_product_id, name, description, short_description, url_key, meta_title, meta_description, meta_keywords) FROM stdin;
\.


--
-- TOC entry 4080 (class 0 OID 25003)
-- Dependencies: 267
-- Data for Name: product_inventory; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.product_inventory (id, product_inventory_product_id, qty, manage_stock, stock_availability) FROM stdin;
\.


--
-- TOC entry 4086 (class 0 OID 25043)
-- Dependencies: 273
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.products (id, name, description, price, tags, create_at, update_at, delete_at, uuid, type, variant_group_id, visibility, group_id, sku, weight, status, "categoryId", "groupId", "taxClassId", "variantGroupId", discount, rating, "numReviews") FROM stdin;
\.


--
-- TOC entry 4114 (class 0 OID 25215)
-- Dependencies: 301
-- Data for Name: reset_password_token; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.reset_password_token (id, token, created_at, "customerId") FROM stdin;
\.


--
-- TOC entry 4136 (class 0 OID 90782)
-- Dependencies: 323
-- Data for Name: seeds; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.seeds (id, "timestamp", name) FROM stdin;
1	1732966543594	Seeders1732966543594
2	2	Seeders
\.


--
-- TOC entry 4116 (class 0 OID 25225)
-- Dependencies: 303
-- Data for Name: setting; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.setting (id, uuid, name, value, is_json) FROM stdin;
\.


--
-- TOC entry 4100 (class 0 OID 25128)
-- Dependencies: 287
-- Data for Name: shipment; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.shipment (id, uuid, shipment_order_id, carrier, tracking_number, created_at, updated_at, "shipmentOrderId") FROM stdin;
\.


--
-- TOC entry 4046 (class 0 OID 24772)
-- Dependencies: 233
-- Data for Name: shipping_method; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.shipping_method (id, uuid, name) FROM stdin;
\.


--
-- TOC entry 4052 (class 0 OID 24810)
-- Dependencies: 239
-- Data for Name: shipping_zone; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.shipping_zone (id, uuid, name, country) FROM stdin;
\.


--
-- TOC entry 4048 (class 0 OID 24784)
-- Dependencies: 235
-- Data for Name: shipping_zone_method; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.shipping_zone_method (id, method_id, zone_id, is_enabled, cost, calculate_api, condition_type, max, min, "methodId", "zoneId") FROM stdin;
\.


--
-- TOC entry 4050 (class 0 OID 24798)
-- Dependencies: 237
-- Data for Name: shipping_zone_province; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.shipping_zone_province (shipping_zone_province_id, uuid, zone_id, province, "zoneId") FROM stdin;
\.


--
-- TOC entry 4036 (class 0 OID 24725)
-- Dependencies: 223
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.stores (id, name) FROM stdin;
\.


--
-- TOC entry 4084 (class 0 OID 25033)
-- Dependencies: 271
-- Data for Name: tax_class; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.tax_class (id, uuid, name) FROM stdin;
\.


--
-- TOC entry 4082 (class 0 OID 25015)
-- Dependencies: 269
-- Data for Name: tax_rate; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.tax_rate (id, uuid, name, tax_class_id, country, province, postcode, rate, is_compound, priority, "taxClassId") FROM stdin;
\.


--
-- TOC entry 4118 (class 0 OID 25238)
-- Dependencies: 305
-- Data for Name: url_rewrite; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.url_rewrite (id, language, request_path, target_path, entity_uuid, entity_type) FROM stdin;
\.


--
-- TOC entry 4030 (class 0 OID 24684)
-- Dependencies: 217
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public."user" (id, email, nickname, password, provider, status, "socialId", "firstName", "lastName", "createdAt", hash, "updatedAt") FROM stdin;
1	admin@recreando.dev	\N	$2a$10$fMjzaHWGks4uZ1kPDDh.QubI9CqeOwdNSva2LvW.FLI/vpsYI.qa.	email	inactive	\N	amir	marin	2024-05-07 20:08:26.427979	\N	2024-05-07 20:08:26.427979
\.


--
-- TOC entry 4060 (class 0 OID 24862)
-- Dependencies: 247
-- Data for Name: variant_group; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.variant_group (id, uuid, attribute_group_id, attribute_one, attribute_two, attribute_three, attribute_four, attribute_five, visibility, "attributeFive2Id", "attributeFour2Id", "attributeGroupId", "attributeOne2Id", "attributeThree2Id", "attributeTwo2Id") FROM stdin;
\.


--
-- TOC entry 4199 (class 0 OID 0)
-- Dependencies: 226
-- Name: accounts_counter_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.accounts_counter_settings_id_seq', 1, false);


--
-- TOC entry 4200 (class 0 OID 0)
-- Dependencies: 220
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.accounts_id_seq', 82, true);


--
-- TOC entry 4201 (class 0 OID 0)
-- Dependencies: 224
-- Name: accounts_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.accounts_stores_id_seq', 1, false);


--
-- TOC entry 4202 (class 0 OID 0)
-- Dependencies: 218
-- Name: accounts_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.accounts_users_id_seq', 1, false);


--
-- TOC entry 4203 (class 0 OID 0)
-- Dependencies: 308
-- Name: admin_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.admin_user_id_seq', 1, false);


--
-- TOC entry 4204 (class 0 OID 0)
-- Dependencies: 230
-- Name: app_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.app_session_id_seq', 4, true);


--
-- TOC entry 4205 (class 0 OID 0)
-- Dependencies: 250
-- Name: attribute_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.attribute_group_id_seq', 19, true);


--
-- TOC entry 4206 (class 0 OID 0)
-- Dependencies: 248
-- Name: attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.attribute_id_seq', 110, true);


--
-- TOC entry 4207 (class 0 OID 0)
-- Dependencies: 244
-- Name: attribute_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.attribute_option_id_seq', 12, true);


--
-- TOC entry 4208 (class 0 OID 0)
-- Dependencies: 306
-- Name: cart_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.cart_address_id_seq', 1, false);


--
-- TOC entry 4209 (class 0 OID 0)
-- Dependencies: 240
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.cart_id_seq', 1, false);


--
-- TOC entry 4210 (class 0 OID 0)
-- Dependencies: 274
-- Name: cart_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.cart_item_id_seq', 1, false);


--
-- TOC entry 4211 (class 0 OID 0)
-- Dependencies: 276
-- Name: catalog_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.catalog_classes_id_seq', 1, false);


--
-- TOC entry 4212 (class 0 OID 0)
-- Dependencies: 278
-- Name: catalog_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.catalog_types_id_seq', 1, false);


--
-- TOC entry 4213 (class 0 OID 0)
-- Dependencies: 280
-- Name: catalogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.catalogs_id_seq', 1, false);


--
-- TOC entry 4214 (class 0 OID 0)
-- Dependencies: 252
-- Name: category_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.category_description_id_seq', 1, false);


--
-- TOC entry 4215 (class 0 OID 0)
-- Dependencies: 254
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.category_id_seq', 1, false);


--
-- TOC entry 4216 (class 0 OID 0)
-- Dependencies: 310
-- Name: cms_page_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.cms_page_description_id_seq', 1, false);


--
-- TOC entry 4217 (class 0 OID 0)
-- Dependencies: 312
-- Name: cms_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.cms_page_id_seq', 1, false);


--
-- TOC entry 4218 (class 0 OID 0)
-- Dependencies: 256
-- Name: collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.collection_id_seq', 1, false);


--
-- TOC entry 4219 (class 0 OID 0)
-- Dependencies: 314
-- Name: coupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.coupon_id_seq', 1, false);


--
-- TOC entry 4220 (class 0 OID 0)
-- Dependencies: 294
-- Name: customer_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.customer_address_id_seq', 1, false);


--
-- TOC entry 4221 (class 0 OID 0)
-- Dependencies: 296
-- Name: customer_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.customer_group_id_seq', 1, false);


--
-- TOC entry 4222 (class 0 OID 0)
-- Dependencies: 298
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.customer_id_seq', 1, false);


--
-- TOC entry 4223 (class 0 OID 0)
-- Dependencies: 316
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.event_id_seq', 1, false);


--
-- TOC entry 4224 (class 0 OID 0)
-- Dependencies: 228
-- Name: forgot_password_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.forgot_password_id_seq', 1, false);


--
-- TOC entry 4225 (class 0 OID 0)
-- Dependencies: 320
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.migrations_id_seq', 2, true);


--
-- TOC entry 4226 (class 0 OID 0)
-- Dependencies: 318
-- Name: migrations_typeorm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.migrations_typeorm_id_seq', 4, true);


--
-- TOC entry 4227 (class 0 OID 0)
-- Dependencies: 290
-- Name: order_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.order_activity_id_seq', 1, false);


--
-- TOC entry 4228 (class 0 OID 0)
-- Dependencies: 292
-- Name: order_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.order_address_id_seq', 1, false);


--
-- TOC entry 4229 (class 0 OID 0)
-- Dependencies: 288
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.order_id_seq', 1, false);


--
-- TOC entry 4230 (class 0 OID 0)
-- Dependencies: 282
-- Name: order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.order_item_id_seq', 1, false);


--
-- TOC entry 4231 (class 0 OID 0)
-- Dependencies: 284
-- Name: payment_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.payment_transaction_id_seq', 1, false);


--
-- TOC entry 4232 (class 0 OID 0)
-- Dependencies: 242
-- Name: product_attribute_product_attribute_value_index_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.product_attribute_product_attribute_value_index_id_seq', 1, false);


--
-- TOC entry 4233 (class 0 OID 0)
-- Dependencies: 258
-- Name: product_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.product_collection_id_seq', 1, false);


--
-- TOC entry 4234 (class 0 OID 0)
-- Dependencies: 262
-- Name: product_custom_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.product_custom_option_id_seq', 1, false);


--
-- TOC entry 4235 (class 0 OID 0)
-- Dependencies: 260
-- Name: product_custom_option_value_product_custom_option_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.product_custom_option_value_product_custom_option_value_id_seq', 1, false);


--
-- TOC entry 4236 (class 0 OID 0)
-- Dependencies: 264
-- Name: product_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.product_description_id_seq', 1, false);


--
-- TOC entry 4237 (class 0 OID 0)
-- Dependencies: 266
-- Name: product_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.product_inventory_id_seq', 1, false);


--
-- TOC entry 4238 (class 0 OID 0)
-- Dependencies: 272
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- TOC entry 4239 (class 0 OID 0)
-- Dependencies: 300
-- Name: reset_password_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.reset_password_token_id_seq', 1, false);


--
-- TOC entry 4240 (class 0 OID 0)
-- Dependencies: 322
-- Name: seeds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.seeds_id_seq', 2, true);


--
-- TOC entry 4241 (class 0 OID 0)
-- Dependencies: 302
-- Name: setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.setting_id_seq', 1, false);


--
-- TOC entry 4242 (class 0 OID 0)
-- Dependencies: 286
-- Name: shipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.shipment_id_seq', 1, false);


--
-- TOC entry 4243 (class 0 OID 0)
-- Dependencies: 232
-- Name: shipping_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.shipping_method_id_seq', 1, false);


--
-- TOC entry 4244 (class 0 OID 0)
-- Dependencies: 238
-- Name: shipping_zone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.shipping_zone_id_seq', 1, false);


--
-- TOC entry 4245 (class 0 OID 0)
-- Dependencies: 234
-- Name: shipping_zone_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.shipping_zone_method_id_seq', 1, false);


--
-- TOC entry 4246 (class 0 OID 0)
-- Dependencies: 236
-- Name: shipping_zone_province_shipping_zone_province_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.shipping_zone_province_shipping_zone_province_id_seq', 1, false);


--
-- TOC entry 4247 (class 0 OID 0)
-- Dependencies: 222
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.stores_id_seq', 1, false);


--
-- TOC entry 4248 (class 0 OID 0)
-- Dependencies: 270
-- Name: tax_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.tax_class_id_seq', 1, false);


--
-- TOC entry 4249 (class 0 OID 0)
-- Dependencies: 268
-- Name: tax_rate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.tax_rate_id_seq', 1, false);


--
-- TOC entry 4250 (class 0 OID 0)
-- Dependencies: 304
-- Name: url_rewrite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.url_rewrite_id_seq', 1, false);


--
-- TOC entry 4251 (class 0 OID 0)
-- Dependencies: 216
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- TOC entry 4252 (class 0 OID 0)
-- Dependencies: 246
-- Name: variant_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.variant_group_id_seq', 1, false);


--
-- TOC entry 3706 (class 2606 OID 24860)
-- Name: attribute_option PK_06630b72345d91a8e3cb5245a57; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.attribute_option
    ADD CONSTRAINT "PK_06630b72345d91a8e3cb5245a57" PRIMARY KEY (id);


--
-- TOC entry 3700 (class 2606 OID 24818)
-- Name: shipping_zone PK_07ba5dcdabaa4854f554c777ef4; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shipping_zone
    ADD CONSTRAINT "PK_07ba5dcdabaa4854f554c777ef4" PRIMARY KEY (id);


--
-- TOC entry 3756 (class 2606 OID 25057)
-- Name: products PK_0806c755e0aca124e67c0cf6d7d; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "PK_0806c755e0aca124e67c0cf6d7d" PRIMARY KEY (id);


--
-- TOC entry 3812 (class 2606 OID 25284)
-- Name: cms_page_description PK_0bcfbe5eb8d5bba60010628a492; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cms_page_description
    ADD CONSTRAINT "PK_0bcfbe5eb8d5bba60010628a492" PRIMARY KEY (id);


--
-- TOC entry 3736 (class 2606 OID 24988)
-- Name: product_custom_option PK_0d8bf1f9eb45b626f53497da156; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_custom_option
    ADD CONSTRAINT "PK_0d8bf1f9eb45b626f53497da156" PRIMARY KEY (id);


--
-- TOC entry 3778 (class 2606 OID 25150)
-- Name: order PK_1031171c13130102495201e3e20; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "PK_1031171c13130102495201e3e20" PRIMARY KEY (id);


--
-- TOC entry 3714 (class 2606 OID 24907)
-- Name: attribute_group PK_11db6f6e398d4a944607fefa37a; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.attribute_group
    ADD CONSTRAINT "PK_11db6f6e398d4a944607fefa37a" PRIMARY KEY (id);


--
-- TOC entry 3766 (class 2606 OID 25101)
-- Name: catalogs PK_1883399275415ee6107413fe6c3; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.catalogs
    ADD CONSTRAINT "PK_1883399275415ee6107413fe6c3" PRIMARY KEY (id);


--
-- TOC entry 3696 (class 2606 OID 24806)
-- Name: shipping_zone_province PK_1a24e96dd3b9fac4f1873ace134; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shipping_zone_province
    ADD CONSTRAINT "PK_1a24e96dd3b9fac4f1873ace134" PRIMARY KEY (shipping_zone_province_id);


--
-- TOC entry 3836 (class 2606 OID 99002)
-- Name: images PK_1fe148074c6a1a91b63cb9ee3c9; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT "PK_1fe148074c6a1a91b63cb9ee3c9" PRIMARY KEY (id);


--
-- TOC entry 3786 (class 2606 OID 25187)
-- Name: customer_address PK_23810fb397050d8ac37dae44ff6; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.customer_address
    ADD CONSTRAINT "PK_23810fb397050d8ac37dae44ff6" PRIMARY KEY (id);


--
-- TOC entry 3748 (class 2606 OID 25027)
-- Name: tax_rate PK_23b71b53f650c0b39e99ccef4fd; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "PK_23b71b53f650c0b39e99ccef4fd" PRIMARY KEY (id);


--
-- TOC entry 3782 (class 2606 OID 25165)
-- Name: order_activity PK_25304ed890cb401f380859bbfd0; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.order_activity
    ADD CONSTRAINT "PK_25304ed890cb401f380859bbfd0" PRIMARY KEY (id);


--
-- TOC entry 3824 (class 2606 OID 25328)
-- Name: event PK_30c2f3bbaf6d34a55f8ae6e4614; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT "PK_30c2f3bbaf6d34a55f8ae6e4614" PRIMARY KEY (id);


--
-- TOC entry 3830 (class 2606 OID 90789)
-- Name: seeds PK_3ac799e4ece18bc838823bb6a4b; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.seeds
    ADD CONSTRAINT "PK_3ac799e4ece18bc838823bb6a4b" PRIMARY KEY (id);


--
-- TOC entry 3826 (class 2606 OID 70108)
-- Name: migrations_typeorm PK_48f349806db3f6cc916da893c67; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migrations_typeorm
    ADD CONSTRAINT "PK_48f349806db3f6cc916da893c67" PRIMARY KEY (id);


--
-- TOC entry 3728 (class 2606 OID 24963)
-- Name: product_collection PK_49d419fc77d3aed46c835c558ac; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_collection
    ADD CONSTRAINT "PK_49d419fc77d3aed46c835c558ac" PRIMARY KEY (id);


--
-- TOC entry 3684 (class 2606 OID 24770)
-- Name: app_session PK_4bb97109908712eb73672a96571; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.app_session
    ADD CONSTRAINT "PK_4bb97109908712eb73672a96571" PRIMARY KEY (id, sid);


--
-- TOC entry 3672 (class 2606 OID 24713)
-- Name: accounts_users PK_4c00a2cf21bdb99e9dc64dcc75c; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.accounts_users
    ADD CONSTRAINT "PK_4c00a2cf21bdb99e9dc64dcc75c" PRIMARY KEY (id);


--
-- TOC entry 3716 (class 2606 OID 24916)
-- Name: category_description PK_4e3ac68dcedc09b734c76b5988e; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.category_description
    ADD CONSTRAINT "PK_4e3ac68dcedc09b734c76b5988e" PRIMARY KEY (id);


--
-- TOC entry 3690 (class 2606 OID 24792)
-- Name: shipping_zone_method PK_5971ae311d3dac1347ea10583fb; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shipping_zone_method
    ADD CONSTRAINT "PK_5971ae311d3dac1347ea10583fb" PRIMARY KEY (id);


--
-- TOC entry 3674 (class 2606 OID 24723)
-- Name: accounts PK_5a7a02c20412299d198e097a8fe; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT "PK_5a7a02c20412299d198e097a8fe" PRIMARY KEY (id);


--
-- TOC entry 3680 (class 2606 OID 24750)
-- Name: accounts_counter_settings PK_677f84fd60453e6911f4f99e112; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.accounts_counter_settings
    ADD CONSTRAINT "PK_677f84fd60453e6911f4f99e112" PRIMARY KEY (id);


--
-- TOC entry 3678 (class 2606 OID 24739)
-- Name: accounts_stores PK_728b816c6831b32d61c81f530a1; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.accounts_stores
    ADD CONSTRAINT "PK_728b816c6831b32d61c81f530a1" PRIMARY KEY (id);


--
-- TOC entry 3834 (class 2606 OID 98976)
-- Name: attribute_groups_attribute_group PK_74c80fd4738e4663f734d42be99; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.attribute_groups_attribute_group
    ADD CONSTRAINT "PK_74c80fd4738e4663f734d42be99" PRIMARY KEY ("attributeId", "attributeGroupId");


--
-- TOC entry 3676 (class 2606 OID 24732)
-- Name: stores PK_7aa6e7d71fa7acdd7ca43d7c9cb; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT "PK_7aa6e7d71fa7acdd7ca43d7c9cb" PRIMARY KEY (id);


--
-- TOC entry 3770 (class 2606 OID 25122)
-- Name: payment_transaction PK_82c3470854cf4642dfb0d7150cd; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.payment_transaction
    ADD CONSTRAINT "PK_82c3470854cf4642dfb0d7150cd" PRIMARY KEY (id);


--
-- TOC entry 3744 (class 2606 OID 25011)
-- Name: product_inventory PK_84e9362e0a5bf063e561d9452ba; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_inventory
    ADD CONSTRAINT "PK_84e9362e0a5bf063e561d9452ba" PRIMARY KEY (id);


--
-- TOC entry 3764 (class 2606 OID 25089)
-- Name: catalog_types PK_8541ba71675bc020a25c6e37255; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.catalog_types
    ADD CONSTRAINT "PK_8541ba71675bc020a25c6e37255" PRIMARY KEY (id);


--
-- TOC entry 3788 (class 2606 OID 25199)
-- Name: customer_group PK_88e7da3ff7262d9e0a35aa3664e; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.customer_group
    ADD CONSTRAINT "PK_88e7da3ff7262d9e0a35aa3664e" PRIMARY KEY (id);


--
-- TOC entry 3704 (class 2606 OID 24846)
-- Name: product_attribute PK_8a59dd85b07d54932926ac54513; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT "PK_8a59dd85b07d54932926ac54513" PRIMARY KEY (product_attribute_value_index_id);


--
-- TOC entry 3828 (class 2606 OID 90780)
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- TOC entry 3818 (class 2606 OID 25300)
-- Name: cms_page PK_930fa3419b13beec75cc102b600; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cms_page
    ADD CONSTRAINT "PK_930fa3419b13beec75cc102b600" PRIMARY KEY (id);


--
-- TOC entry 3682 (class 2606 OID 24760)
-- Name: forgot_password PK_9b1bedb8b9dd6834196533ee41b; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.forgot_password
    ADD CONSTRAINT "PK_9b1bedb8b9dd6834196533ee41b" PRIMARY KEY (id);


--
-- TOC entry 3722 (class 2606 OID 24930)
-- Name: category PK_9c4e4a89e3674fc9f382d733f03; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT "PK_9c4e4a89e3674fc9f382d733f03" PRIMARY KEY (id);


--
-- TOC entry 3808 (class 2606 OID 25273)
-- Name: admin_user PK_a28028ba709cd7e5053a86857b4; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.admin_user
    ADD CONSTRAINT "PK_a28028ba709cd7e5053a86857b4" PRIMARY KEY (id);


--
-- TOC entry 3790 (class 2606 OID 25211)
-- Name: customer PK_a7a13f4cacb744524e44dfdad32; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "PK_a7a13f4cacb744524e44dfdad32" PRIMARY KEY (id);


--
-- TOC entry 3800 (class 2606 OID 25246)
-- Name: url_rewrite PK_ab6e7beb48bd9b7df7ffa650c40; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.url_rewrite
    ADD CONSTRAINT "PK_ab6e7beb48bd9b7df7ffa650c40" PRIMARY KEY (id);


--
-- TOC entry 3724 (class 2606 OID 24954)
-- Name: collection PK_ad3f485bbc99d875491f44d7c85; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT "PK_ad3f485bbc99d875491f44d7c85" PRIMARY KEY (id);


--
-- TOC entry 3754 (class 2606 OID 25041)
-- Name: tax_class PK_b0218b0fd9003952da1e073dc78; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tax_class
    ADD CONSTRAINT "PK_b0218b0fd9003952da1e073dc78" PRIMARY KEY (id);


--
-- TOC entry 3710 (class 2606 OID 24882)
-- Name: attribute PK_b13fb7c5c9e9dff62b60e0de729; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT "PK_b13fb7c5c9e9dff62b60e0de729" PRIMARY KEY (id);


--
-- TOC entry 3686 (class 2606 OID 24780)
-- Name: shipping_method PK_b9b0adfad3c6b99229c1e7d4865; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "PK_b9b0adfad3c6b99229c1e7d4865" PRIMARY KEY (id);


--
-- TOC entry 3760 (class 2606 OID 25071)
-- Name: cart_item PK_bd94725aa84f8cf37632bcde997; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT "PK_bd94725aa84f8cf37632bcde997" PRIMARY KEY (id);


--
-- TOC entry 3702 (class 2606 OID 24837)
-- Name: cart PK_c524ec48751b9b5bcfbf6e59be7; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "PK_c524ec48751b9b5bcfbf6e59be7" PRIMARY KEY (id);


--
-- TOC entry 3794 (class 2606 OID 25223)
-- Name: reset_password_token PK_c6f6eb8f5c88ac0233eceb8d385; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reset_password_token
    ADD CONSTRAINT "PK_c6f6eb8f5c88ac0233eceb8d385" PRIMARY KEY (id);


--
-- TOC entry 3668 (class 2606 OID 24695)
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- TOC entry 3738 (class 2606 OID 24997)
-- Name: product_description PK_ced8671d69966133eeb83d4df0b; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_description
    ADD CONSTRAINT "PK_ced8671d69966133eeb83d4df0b" PRIMARY KEY (id);


--
-- TOC entry 3768 (class 2606 OID 25111)
-- Name: order_item PK_d01158fe15b1ead5c26fd7f4e90; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT "PK_d01158fe15b1ead5c26fd7f4e90" PRIMARY KEY (id);


--
-- TOC entry 3762 (class 2606 OID 25080)
-- Name: catalog_classes PK_e540a91bd1a83a3b97604bc5d80; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.catalog_classes
    ADD CONSTRAINT "PK_e540a91bd1a83a3b97604bc5d80" PRIMARY KEY (id);


--
-- TOC entry 3734 (class 2606 OID 24977)
-- Name: product_custom_option_value PK_f05e33c6a43a353253b18e9eeee; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_custom_option_value
    ADD CONSTRAINT "PK_f05e33c6a43a353253b18e9eeee" PRIMARY KEY (product_custom_option_value_id);


--
-- TOC entry 3784 (class 2606 OID 25175)
-- Name: order_address PK_f07603e96b068aae820d4590270; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.order_address
    ADD CONSTRAINT "PK_f07603e96b068aae820d4590270" PRIMARY KEY (id);


--
-- TOC entry 3806 (class 2606 OID 25260)
-- Name: cart_address PK_f13fc95d3331408030b98fc72aa; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cart_address
    ADD CONSTRAINT "PK_f13fc95d3331408030b98fc72aa" PRIMARY KEY (id);


--
-- TOC entry 3776 (class 2606 OID 25138)
-- Name: shipment PK_f51f635db95c534ca206bf7a0a4; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shipment
    ADD CONSTRAINT "PK_f51f635db95c534ca206bf7a0a4" PRIMARY KEY (id);


--
-- TOC entry 3708 (class 2606 OID 24869)
-- Name: variant_group PK_f61c9451fd3301da9586232597a; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.variant_group
    ADD CONSTRAINT "PK_f61c9451fd3301da9586232597a" PRIMARY KEY (id);


--
-- TOC entry 3796 (class 2606 OID 25234)
-- Name: setting PK_fcb21187dc6094e24a48f677bed; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.setting
    ADD CONSTRAINT "PK_fcb21187dc6094e24a48f677bed" PRIMARY KEY (id);


--
-- TOC entry 3820 (class 2606 OID 25315)
-- Name: coupon PK_fcbe9d72b60eed35f46dc35a682; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.coupon
    ADD CONSTRAINT "PK_fcbe9d72b60eed35f46dc35a682" PRIMARY KEY (id);


--
-- TOC entry 3750 (class 2606 OID 25031)
-- Name: tax_rate UQ_04eee0f60193c9cca17a58633c8; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "UQ_04eee0f60193c9cca17a58633c8" UNIQUE (priority);


--
-- TOC entry 3726 (class 2606 OID 24956)
-- Name: collection UQ_0518027a82c85d26b18527fedaf; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT "UQ_0518027a82c85d26b18527fedaf" UNIQUE (code);


--
-- TOC entry 3814 (class 2606 OID 25288)
-- Name: cms_page_description UQ_16043dcd6a0dec4fd01a6f87959; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cms_page_description
    ADD CONSTRAINT "UQ_16043dcd6a0dec4fd01a6f87959" UNIQUE (url_key);


--
-- TOC entry 3730 (class 2606 OID 24965)
-- Name: product_collection UQ_2346dc7fab96336a85a6418b776; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_collection
    ADD CONSTRAINT "UQ_2346dc7fab96336a85a6418b776" UNIQUE (collection_id);


--
-- TOC entry 3798 (class 2606 OID 25236)
-- Name: setting UQ_27923d152bbf82683ab795d5476; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.setting
    ADD CONSTRAINT "UQ_27923d152bbf82683ab795d5476" UNIQUE (name);


--
-- TOC entry 3732 (class 2606 OID 24967)
-- Name: product_collection UQ_339ecc9827594501895301ffec7; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_collection
    ADD CONSTRAINT "UQ_339ecc9827594501895301ffec7" UNIQUE (product_id);


--
-- TOC entry 3712 (class 2606 OID 88053)
-- Name: attribute UQ_3c3dadeb70707dfe5a6b3fd7f85; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT "UQ_3c3dadeb70707dfe5a6b3fd7f85" UNIQUE (code);


--
-- TOC entry 3740 (class 2606 OID 25001)
-- Name: product_description UQ_48af331a82fc28592ae550eb834; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_description
    ADD CONSTRAINT "UQ_48af331a82fc28592ae550eb834" UNIQUE (url_key);


--
-- TOC entry 3772 (class 2606 OID 25126)
-- Name: payment_transaction UQ_5d662065a6c8a45d35e77e9cc81; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.payment_transaction
    ADD CONSTRAINT "UQ_5d662065a6c8a45d35e77e9cc81" UNIQUE (transaction_id);


--
-- TOC entry 3802 (class 2606 OID 25248)
-- Name: url_rewrite UQ_5f4ed1a6b8a315446380c79903f; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.url_rewrite
    ADD CONSTRAINT "UQ_5f4ed1a6b8a315446380c79903f" UNIQUE (language);


--
-- TOC entry 3746 (class 2606 OID 25013)
-- Name: product_inventory UQ_67303992e9f22a3cd22d3ffa096; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_inventory
    ADD CONSTRAINT "UQ_67303992e9f22a3cd22d3ffa096" UNIQUE (product_inventory_product_id);


--
-- TOC entry 3804 (class 2606 OID 25250)
-- Name: url_rewrite UQ_73eaf974bdb32d26b362ae7f3e5; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.url_rewrite
    ADD CONSTRAINT "UQ_73eaf974bdb32d26b362ae7f3e5" UNIQUE (entity_uuid);


--
-- TOC entry 3822 (class 2606 OID 25317)
-- Name: coupon UQ_75af98fc8fbae69cf49e6df639c; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.coupon
    ADD CONSTRAINT "UQ_75af98fc8fbae69cf49e6df639c" UNIQUE (coupon);


--
-- TOC entry 3774 (class 2606 OID 25124)
-- Name: payment_transaction UQ_82878554bd1cd0f8672d6fbca06; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.payment_transaction
    ADD CONSTRAINT "UQ_82878554bd1cd0f8672d6fbca06" UNIQUE (payment_transaction_order_id);


--
-- TOC entry 3810 (class 2606 OID 25275)
-- Name: admin_user UQ_840ac5cd67be99efa5cd989bf9f; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.admin_user
    ADD CONSTRAINT "UQ_840ac5cd67be99efa5cd989bf9f" UNIQUE (email);


--
-- TOC entry 3718 (class 2606 OID 24920)
-- Name: category_description UQ_8ce70e22098d6d874be26442af4; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.category_description
    ADD CONSTRAINT "UQ_8ce70e22098d6d874be26442af4" UNIQUE (url_key);


--
-- TOC entry 3698 (class 2606 OID 24808)
-- Name: shipping_zone_province UQ_9204fa970c1261f300a350df8ce; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shipping_zone_province
    ADD CONSTRAINT "UQ_9204fa970c1261f300a350df8ce" UNIQUE (province);


--
-- TOC entry 3720 (class 2606 OID 24918)
-- Name: category_description UQ_99a6344d669315b2523f9608a9a; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.category_description
    ADD CONSTRAINT "UQ_99a6344d669315b2523f9608a9a" UNIQUE (category_description_category_id);


--
-- TOC entry 3692 (class 2606 OID 24796)
-- Name: shipping_zone_method UQ_a01c1ce91bd5f02d06005338143; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shipping_zone_method
    ADD CONSTRAINT "UQ_a01c1ce91bd5f02d06005338143" UNIQUE (zone_id);


--
-- TOC entry 3688 (class 2606 OID 24782)
-- Name: shipping_method UQ_b162a8b6b57c9e09c852208772e; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "UQ_b162a8b6b57c9e09c852208772e" UNIQUE (name);


--
-- TOC entry 3758 (class 2606 OID 25059)
-- Name: products UQ_c44ac33a05b144dd0d9ddcf9327; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "UQ_c44ac33a05b144dd0d9ddcf9327" UNIQUE (sku);


--
-- TOC entry 3752 (class 2606 OID 25029)
-- Name: tax_rate UQ_d5d407490e8b5384dd349459f9a; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "UQ_d5d407490e8b5384dd349459f9a" UNIQUE (tax_class_id);


--
-- TOC entry 3816 (class 2606 OID 25286)
-- Name: cms_page_description UQ_dc6ad52008d95bf01885ea64f9f; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cms_page_description
    ADD CONSTRAINT "UQ_dc6ad52008d95bf01885ea64f9f" UNIQUE (cms_page_description_cms_page_id);


--
-- TOC entry 3670 (class 2606 OID 24697)
-- Name: user UQ_e12875dfb3b1d92d7d7c5377e22; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "UQ_e12875dfb3b1d92d7d7c5377e22" UNIQUE (email);


--
-- TOC entry 3742 (class 2606 OID 24999)
-- Name: product_description UQ_e7ce69a0b0069128bd4571d11fe; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_description
    ADD CONSTRAINT "UQ_e7ce69a0b0069128bd4571d11fe" UNIQUE (product_description_product_id);


--
-- TOC entry 3694 (class 2606 OID 24794)
-- Name: shipping_zone_method UQ_e858ffdba5071dd396e97c8e861; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shipping_zone_method
    ADD CONSTRAINT "UQ_e858ffdba5071dd396e97c8e861" UNIQUE (method_id);


--
-- TOC entry 3780 (class 2606 OID 25152)
-- Name: order UQ_f9180f384353c621e8d0c414c14; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "UQ_f9180f384353c621e8d0c414c14" UNIQUE (order_number);


--
-- TOC entry 3792 (class 2606 OID 25213)
-- Name: customer UQ_fdb2f3ad8115da4c7718109a6eb; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "UQ_fdb2f3ad8115da4c7718109a6eb" UNIQUE (email);


--
-- TOC entry 3831 (class 1259 OID 98977)
-- Name: IDX_5c864a916aea7b393e964e9252; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX "IDX_5c864a916aea7b393e964e9252" ON public.attribute_groups_attribute_group USING btree ("attributeId");


--
-- TOC entry 3832 (class 1259 OID 98978)
-- Name: IDX_656819655bb3937edc8c970d62; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX "IDX_656819655bb3937edc8c970d62" ON public.attribute_groups_attribute_group USING btree ("attributeGroupId");


--
-- TOC entry 3846 (class 2606 OID 25374)
-- Name: shipping_zone_method FK_0500cabf4de52505e89edd811c5; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shipping_zone_method
    ADD CONSTRAINT "FK_0500cabf4de52505e89edd811c5" FOREIGN KEY ("methodId") REFERENCES public.shipping_method(id) ON DELETE CASCADE;


--
-- TOC entry 3876 (class 2606 OID 25539)
-- Name: shipment FK_08b4b4d8efbbc0b227f49e5b20c; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shipment
    ADD CONSTRAINT "FK_08b4b4d8efbbc0b227f49e5b20c" FOREIGN KEY ("shipmentOrderId") REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- TOC entry 3872 (class 2606 OID 25519)
-- Name: catalogs FK_090b993d12335da5c26ac3b4d72; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.catalogs
    ADD CONSTRAINT "FK_090b993d12335da5c26ac3b4d72" FOREIGN KEY (catalog_type_id) REFERENCES public.catalog_types(id);


--
-- TOC entry 3854 (class 2606 OID 25424)
-- Name: variant_group FK_0a3d7a003ee60936afa49bb710b; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.variant_group
    ADD CONSTRAINT "FK_0a3d7a003ee60936afa49bb710b" FOREIGN KEY ("attributeGroupId") REFERENCES public.attribute_group(id) ON DELETE CASCADE;


--
-- TOC entry 3853 (class 2606 OID 25409)
-- Name: attribute_option FK_0f970f7e5632357537ae1230ea8; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.attribute_option
    ADD CONSTRAINT "FK_0f970f7e5632357537ae1230ea8" FOREIGN KEY ("attributeId") REFERENCES public.attribute(id) ON DELETE CASCADE;


--
-- TOC entry 3880 (class 2606 OID 25559)
-- Name: reset_password_token FK_0fc8d103b9dc705092f84f537f4; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.reset_password_token
    ADD CONSTRAINT "FK_0fc8d103b9dc705092f84f537f4" FOREIGN KEY ("customerId") REFERENCES public.customer(id) ON DELETE CASCADE;


--
-- TOC entry 3864 (class 2606 OID 25479)
-- Name: tax_rate FK_1128471f4075d619aaada7cac45; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "FK_1128471f4075d619aaada7cac45" FOREIGN KEY ("taxClassId") REFERENCES public.tax_class(id) ON DELETE CASCADE;


--
-- TOC entry 3850 (class 2606 OID 25399)
-- Name: product_attribute FK_127fec70732c617c5970674f10e; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT "FK_127fec70732c617c5970674f10e" FOREIGN KEY ("optionId") REFERENCES public.attribute_option(id) ON DELETE CASCADE;


--
-- TOC entry 3841 (class 2606 OID 25354)
-- Name: accounts_counter_settings FK_223606ace3028d836c3f69f69ea; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.accounts_counter_settings
    ADD CONSTRAINT "FK_223606ace3028d836c3f69f69ea" FOREIGN KEY ("createdByUserId") REFERENCES public."user"(id);


--
-- TOC entry 3869 (class 2606 OID 25504)
-- Name: cart_item FK_29e590514f9941296f3a2440d39; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT "FK_29e590514f9941296f3a2440d39" FOREIGN KEY ("cartId") REFERENCES public.cart(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3839 (class 2606 OID 25339)
-- Name: accounts_stores FK_3ff5d390c8c4a142d437184c779; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.accounts_stores
    ADD CONSTRAINT "FK_3ff5d390c8c4a142d437184c779" FOREIGN KEY ("accountId") REFERENCES public.accounts(id);


--
-- TOC entry 3855 (class 2606 OID 25414)
-- Name: variant_group FK_4446809aae5ea40c716c7f85c22; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.variant_group
    ADD CONSTRAINT "FK_4446809aae5ea40c716c7f85c22" FOREIGN KEY ("attributeFive2Id") REFERENCES public.attribute(id) ON DELETE CASCADE;


--
-- TOC entry 3847 (class 2606 OID 25379)
-- Name: shipping_zone_method FK_4899c2a105725f0f120bf192e35; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shipping_zone_method
    ADD CONSTRAINT "FK_4899c2a105725f0f120bf192e35" FOREIGN KEY ("zoneId") REFERENCES public.shipping_zone(id) ON DELETE CASCADE;


--
-- TOC entry 3851 (class 2606 OID 25394)
-- Name: product_attribute FK_5134aa627db96cdfb1bf0be5223; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT "FK_5134aa627db96cdfb1bf0be5223" FOREIGN KEY ("attributeId") REFERENCES public.attribute(id) ON DELETE CASCADE;


--
-- TOC entry 3837 (class 2606 OID 25329)
-- Name: accounts_users FK_51352b32979fa41070de69f9bf9; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.accounts_users
    ADD CONSTRAINT "FK_51352b32979fa41070de69f9bf9" FOREIGN KEY ("accountId") REFERENCES public.accounts(id);


--
-- TOC entry 3842 (class 2606 OID 25349)
-- Name: accounts_counter_settings FK_535b7273f890f121664ec25ffaa; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.accounts_counter_settings
    ADD CONSTRAINT "FK_535b7273f890f121664ec25ffaa" FOREIGN KEY ("accountId") REFERENCES public.accounts(id);


--
-- TOC entry 3856 (class 2606 OID 25419)
-- Name: variant_group FK_576e1e5f2e465903d42a50f8480; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.variant_group
    ADD CONSTRAINT "FK_576e1e5f2e465903d42a50f8480" FOREIGN KEY ("attributeFour2Id") REFERENCES public.attribute(id) ON DELETE CASCADE;


--
-- TOC entry 3883 (class 2606 OID 99008)
-- Name: images FK_594a6101f27df673791202226aa; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT "FK_594a6101f27df673791202226aa" FOREIGN KEY ("updatedByUserId") REFERENCES public."user"(id);


--
-- TOC entry 3874 (class 2606 OID 25529)
-- Name: order_item FK_5c3858a7f958bba55a734447095; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT "FK_5c3858a7f958bba55a734447095" FOREIGN KEY ("orderItemOrderId") REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- TOC entry 3881 (class 2606 OID 98982)
-- Name: attribute_groups_attribute_group FK_5c864a916aea7b393e964e9252c; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.attribute_groups_attribute_group
    ADD CONSTRAINT "FK_5c864a916aea7b393e964e9252c" FOREIGN KEY ("attributeId") REFERENCES public.attribute(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3882 (class 2606 OID 98987)
-- Name: attribute_groups_attribute_group FK_656819655bb3937edc8c970d626; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.attribute_groups_attribute_group
    ADD CONSTRAINT "FK_656819655bb3937edc8c970d626" FOREIGN KEY ("attributeGroupId") REFERENCES public.attribute_group(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3845 (class 2606 OID 25369)
-- Name: app_session FK_668b7a8ff1eb635e2c6888e3091; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.app_session
    ADD CONSTRAINT "FK_668b7a8ff1eb635e2c6888e3091" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- TOC entry 3879 (class 2606 OID 25554)
-- Name: customer FK_6957a7019e8dfbbae779fdd9fc4; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "FK_6957a7019e8dfbbae779fdd9fc4" FOREIGN KEY ("groupId") REFERENCES public.customer_group(id) ON DELETE SET NULL;


--
-- TOC entry 3857 (class 2606 OID 25429)
-- Name: variant_group FK_6aa1f59814d5fc41f5fb6733577; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.variant_group
    ADD CONSTRAINT "FK_6aa1f59814d5fc41f5fb6733577" FOREIGN KEY ("attributeOne2Id") REFERENCES public.attribute(id) ON DELETE CASCADE;


--
-- TOC entry 3860 (class 2606 OID 25464)
-- Name: product_collection FK_74939f2405997a66eab143bf3dc; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_collection
    ADD CONSTRAINT "FK_74939f2405997a66eab143bf3dc" FOREIGN KEY ("productId") REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 3870 (class 2606 OID 25509)
-- Name: cart_item FK_75db0de134fe0f9fe9e4591b7bf; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT "FK_75db0de134fe0f9fe9e4591b7bf" FOREIGN KEY ("productId") REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 3865 (class 2606 OID 25489)
-- Name: products FK_8f1611225215b15b7784b2e266d; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "FK_8f1611225215b15b7784b2e266d" FOREIGN KEY ("groupId") REFERENCES public.attribute_group(id) ON DELETE SET NULL;


--
-- TOC entry 3866 (class 2606 OID 25499)
-- Name: products FK_913a4ab786be0dcd640f309aeec; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "FK_913a4ab786be0dcd640f309aeec" FOREIGN KEY ("variantGroupId") REFERENCES public.variant_group(id) ON DELETE SET NULL;


--
-- TOC entry 3843 (class 2606 OID 25359)
-- Name: accounts_counter_settings FK_92676b483a4a59a6676da274497; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.accounts_counter_settings
    ADD CONSTRAINT "FK_92676b483a4a59a6676da274497" FOREIGN KEY ("updatedByUserId") REFERENCES public."user"(id);


--
-- TOC entry 3861 (class 2606 OID 25459)
-- Name: product_collection FK_962b750e1401fa3ce379cec9a59; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_collection
    ADD CONSTRAINT "FK_962b750e1401fa3ce379cec9a59" FOREIGN KEY ("collectionId") REFERENCES public.collection(id) ON DELETE CASCADE;


--
-- TOC entry 3862 (class 2606 OID 25469)
-- Name: product_custom_option_value FK_9742b2cbd6258c385f7a437975f; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_custom_option_value
    ADD CONSTRAINT "FK_9742b2cbd6258c385f7a437975f" FOREIGN KEY ("optionId") REFERENCES public.product_custom_option(id) ON DELETE CASCADE;


--
-- TOC entry 3867 (class 2606 OID 25494)
-- Name: products FK_a5aba6f8e1eea0e1556bbe39a21; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "FK_a5aba6f8e1eea0e1556bbe39a21" FOREIGN KEY ("taxClassId") REFERENCES public.tax_class(id) ON DELETE SET NULL;


--
-- TOC entry 3849 (class 2606 OID 25389)
-- Name: cart FK_a9da25bbbd7ef98e3f61938ee9d; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_a9da25bbbd7ef98e3f61938ee9d" FOREIGN KEY ("shippingZoneId") REFERENCES public.shipping_zone(id) ON DELETE SET NULL;


--
-- TOC entry 3873 (class 2606 OID 25524)
-- Name: catalogs FK_ac63102ad297d54221bda96d6b9; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.catalogs
    ADD CONSTRAINT "FK_ac63102ad297d54221bda96d6b9" FOREIGN KEY (parent_catalog_id) REFERENCES public.catalogs(id) ON DELETE RESTRICT;


--
-- TOC entry 3878 (class 2606 OID 25549)
-- Name: customer_address FK_af004ad3c5bf7e3096f5d40190f; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.customer_address
    ADD CONSTRAINT "FK_af004ad3c5bf7e3096f5d40190f" FOREIGN KEY ("customerId") REFERENCES public.customer(id) ON DELETE CASCADE;


--
-- TOC entry 3838 (class 2606 OID 25334)
-- Name: accounts_users FK_b954503cba3a7b9242c74c3ecf2; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.accounts_users
    ADD CONSTRAINT "FK_b954503cba3a7b9242c74c3ecf2" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- TOC entry 3875 (class 2606 OID 25534)
-- Name: payment_transaction FK_bde774c7838c078d6812d8e7f72; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.payment_transaction
    ADD CONSTRAINT "FK_bde774c7838c078d6812d8e7f72" FOREIGN KEY ("paymentTransactionOrderId") REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3852 (class 2606 OID 25404)
-- Name: product_attribute FK_c0d597555330c0a972122bf4673; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT "FK_c0d597555330c0a972122bf4673" FOREIGN KEY ("productId") REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 3840 (class 2606 OID 25344)
-- Name: accounts_stores FK_c46fc7a09d6b39f3c364396501b; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.accounts_stores
    ADD CONSTRAINT "FK_c46fc7a09d6b39f3c364396501b" FOREIGN KEY ("storeId") REFERENCES public.stores(id);


--
-- TOC entry 3848 (class 2606 OID 25384)
-- Name: shipping_zone_province FK_cbc0776ed8d562747c510fee419; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shipping_zone_province
    ADD CONSTRAINT "FK_cbc0776ed8d562747c510fee419" FOREIGN KEY ("zoneId") REFERENCES public.shipping_zone(id) ON DELETE CASCADE;


--
-- TOC entry 3858 (class 2606 OID 25434)
-- Name: variant_group FK_d8d793469a3d4a3275d83f13a67; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.variant_group
    ADD CONSTRAINT "FK_d8d793469a3d4a3275d83f13a67" FOREIGN KEY ("attributeThree2Id") REFERENCES public.attribute(id) ON DELETE CASCADE;


--
-- TOC entry 3844 (class 2606 OID 25364)
-- Name: forgot_password FK_dba25590105b78ad1a6adfbc6ae; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.forgot_password
    ADD CONSTRAINT "FK_dba25590105b78ad1a6adfbc6ae" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- TOC entry 3877 (class 2606 OID 25544)
-- Name: order_activity FK_ee69b079455a5bcdc28bc4922fc; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.order_activity
    ADD CONSTRAINT "FK_ee69b079455a5bcdc28bc4922fc" FOREIGN KEY ("orderActivityOrderId") REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- TOC entry 3859 (class 2606 OID 25439)
-- Name: variant_group FK_eede71a0e26367dab381f5bb914; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.variant_group
    ADD CONSTRAINT "FK_eede71a0e26367dab381f5bb914" FOREIGN KEY ("attributeTwo2Id") REFERENCES public.attribute(id) ON DELETE CASCADE;


--
-- TOC entry 3884 (class 2606 OID 99013)
-- Name: images FK_efcea6f4c432bac76ad19be6365; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT "FK_efcea6f4c432bac76ad19be6365" FOREIGN KEY ("accountId") REFERENCES public.accounts(id);


--
-- TOC entry 3871 (class 2606 OID 25514)
-- Name: catalog_types FK_f718d5fd03f4581623ad47167c5; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.catalog_types
    ADD CONSTRAINT "FK_f718d5fd03f4581623ad47167c5" FOREIGN KEY (catalog_class_id) REFERENCES public.catalog_classes(id);


--
-- TOC entry 3863 (class 2606 OID 25474)
-- Name: product_custom_option FK_f78f605da984d6971b7c9401a7a; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.product_custom_option
    ADD CONSTRAINT "FK_f78f605da984d6971b7c9401a7a" FOREIGN KEY ("productCustomOptionProductId") REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 3885 (class 2606 OID 99003)
-- Name: images FK_fede2e1ef3f79c267e0817b117a; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT "FK_fede2e1ef3f79c267e0817b117a" FOREIGN KEY ("createdByUserId") REFERENCES public."user"(id);


--
-- TOC entry 3868 (class 2606 OID 25484)
-- Name: products FK_ff56834e735fa78a15d0cf21926; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "FK_ff56834e735fa78a15d0cf21926" FOREIGN KEY ("categoryId") REFERENCES public.category(id) ON DELETE SET NULL;


-- Completed on 2024-12-31 09:40:46 EST

--
-- PostgreSQL database dump complete
--

