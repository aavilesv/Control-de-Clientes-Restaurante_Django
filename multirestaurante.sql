PGDMP         4            	    w            multirestaurantes    10.4    11.2 �    �	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �	           1262    167378    multirestaurantes    DATABASE     �   CREATE DATABASE multirestaurantes WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Ecuador.1252' LC_CTYPE = 'Spanish_Ecuador.1252';
 !   DROP DATABASE multirestaurantes;
             postgres    false            �            1259    167379 
   auth_group    TABLE     e   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);
    DROP TABLE public.auth_group;
       public         postgres    false            �            1259    167382    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       postgres    false    196            �	           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       postgres    false    197            �            1259    167384    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         postgres    false            �            1259    167387    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       postgres    false    198            �	           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       postgres    false    199            �            1259    167389    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         postgres    false            �            1259    167392    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       postgres    false    200            �	           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       postgres    false    201            �            1259    167394 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         postgres    false            �            1259    167400    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         postgres    false            �            1259    167403    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public       postgres    false    203            �	           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
            public       postgres    false    204            �            1259    167405    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       postgres    false    202            �	           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
            public       postgres    false    205            �            1259    167407    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         postgres    false            �            1259    167410 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public       postgres    false    206            �	           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
            public       postgres    false    207            �            1259    167412    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         postgres    false            �            1259    167419    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       postgres    false    208            �	           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       postgres    false    209            �            1259    167421    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         postgres    false            �            1259    167424    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       postgres    false    210            �	           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       postgres    false    211            �            1259    167426    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         postgres    false            �            1259    167432    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       postgres    false    212            �	           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       postgres    false    213            �            1259    167434    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         postgres    false            �            1259    167440    restaurante_calificacionlocal    TABLE     �   CREATE TABLE public.restaurante_calificacionlocal (
    id integer NOT NULL,
    calificacion integer,
    local_id integer,
    votante_id integer
);
 1   DROP TABLE public.restaurante_calificacionlocal;
       public         postgres    false            �            1259    167443 $   restaurante_calificacionlocal_id_seq    SEQUENCE     �   CREATE SEQUENCE public.restaurante_calificacionlocal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.restaurante_calificacionlocal_id_seq;
       public       postgres    false    215            �	           0    0 $   restaurante_calificacionlocal_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.restaurante_calificacionlocal_id_seq OWNED BY public.restaurante_calificacionlocal.id;
            public       postgres    false    216            �            1259    167445    restaurante_categoria    TABLE     �   CREATE TABLE public.restaurante_categoria (
    id integer NOT NULL,
    descripcion character varying(400) NOT NULL,
    estado boolean NOT NULL
);
 )   DROP TABLE public.restaurante_categoria;
       public         postgres    false            �            1259    167448    restaurante_categoria_id_seq    SEQUENCE     �   CREATE SEQUENCE public.restaurante_categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.restaurante_categoria_id_seq;
       public       postgres    false    217            �	           0    0    restaurante_categoria_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.restaurante_categoria_id_seq OWNED BY public.restaurante_categoria.id;
            public       postgres    false    218            �            1259    167450    restaurante_dias    TABLE     �   CREATE TABLE public.restaurante_dias (
    id integer NOT NULL,
    descripcion character varying(400) NOT NULL,
    estado boolean NOT NULL
);
 $   DROP TABLE public.restaurante_dias;
       public         postgres    false            �            1259    167453    restaurante_dias_id_seq    SEQUENCE     �   CREATE SEQUENCE public.restaurante_dias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.restaurante_dias_id_seq;
       public       postgres    false    219            �	           0    0    restaurante_dias_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.restaurante_dias_id_seq OWNED BY public.restaurante_dias.id;
            public       postgres    false    220            �            1259    167455    restaurante_faq    TABLE     �   CREATE TABLE public.restaurante_faq (
    id integer NOT NULL,
    pregunta character varying(1050) NOT NULL,
    respuesta character varying(1200),
    estado boolean NOT NULL
);
 #   DROP TABLE public.restaurante_faq;
       public         postgres    false            �            1259    167461    restaurante_faq_id_seq    SEQUENCE     �   CREATE SEQUENCE public.restaurante_faq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.restaurante_faq_id_seq;
       public       postgres    false    221            �	           0    0    restaurante_faq_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.restaurante_faq_id_seq OWNED BY public.restaurante_faq.id;
            public       postgres    false    222            �            1259    167463    restaurante_horariolocal    TABLE       CREATE TABLE public.restaurante_horariolocal (
    id integer NOT NULL,
    dia_id integer,
    "horaInicio" time without time zone NOT NULL,
    "horaFin" time without time zone NOT NULL,
    local_id integer,
    estado boolean NOT NULL,
    delete boolean NOT NULL
);
 ,   DROP TABLE public.restaurante_horariolocal;
       public         postgres    false            �            1259    167466    restaurante_horariolocal_id_seq    SEQUENCE     �   CREATE SEQUENCE public.restaurante_horariolocal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.restaurante_horariolocal_id_seq;
       public       postgres    false    223            �	           0    0    restaurante_horariolocal_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.restaurante_horariolocal_id_seq OWNED BY public.restaurante_horariolocal.id;
            public       postgres    false    224            �            1259    167468    restaurante_iplocalvisita    TABLE     �   CREATE TABLE public.restaurante_iplocalvisita (
    id integer NOT NULL,
    ip character varying(200),
    local_id integer
);
 -   DROP TABLE public.restaurante_iplocalvisita;
       public         postgres    false            �            1259    167471     restaurante_iplocalvisita_id_seq    SEQUENCE     �   CREATE SEQUENCE public.restaurante_iplocalvisita_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.restaurante_iplocalvisita_id_seq;
       public       postgres    false    225            �	           0    0     restaurante_iplocalvisita_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.restaurante_iplocalvisita_id_seq OWNED BY public.restaurante_iplocalvisita.id;
            public       postgres    false    226            �            1259    167473    restaurante_local    TABLE     �  CREATE TABLE public.restaurante_local (
    id integer NOT NULL,
    documento character varying(50) NOT NULL,
    razonsocial character varying(200),
    "nombreComercial" character varying(200),
    fotouno character varying(100),
    fotodos character varying(100),
    direccion character varying(500),
    telefono character varying(500),
    correo character varying(150),
    estado boolean NOT NULL,
    categoria_id integer,
    propietario_id integer,
    descripcion character varying(2500),
    visita integer NOT NULL,
    valortotal double precision,
    delete boolean NOT NULL,
    oferta boolean NOT NULL,
    ubicacion character varying(1000) NOT NULL
);
 %   DROP TABLE public.restaurante_local;
       public         postgres    false            �            1259    167479    restaurante_local_id_seq    SEQUENCE     �   CREATE SEQUENCE public.restaurante_local_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.restaurante_local_id_seq;
       public       postgres    false    227            �	           0    0    restaurante_local_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.restaurante_local_id_seq OWNED BY public.restaurante_local.id;
            public       postgres    false    228            �            1259    167481    restaurante_platos    TABLE     �  CREATE TABLE public.restaurante_platos (
    id integer NOT NULL,
    nombre character varying(200) NOT NULL,
    descripcion character varying(200) NOT NULL,
    descuento integer NOT NULL,
    precio numeric(11,2) NOT NULL,
    foto character varying(100),
    oferta boolean NOT NULL,
    estado boolean NOT NULL,
    local_id integer,
    delete boolean NOT NULL,
    preciooferta numeric(11,2) NOT NULL
);
 &   DROP TABLE public.restaurante_platos;
       public         postgres    false            �            1259    167487    restaurante_platos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.restaurante_platos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.restaurante_platos_id_seq;
       public       postgres    false    229            �	           0    0    restaurante_platos_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.restaurante_platos_id_seq OWNED BY public.restaurante_platos.id;
            public       postgres    false    230            �            1259    167489    restaurante_usuarios    TABLE     �  CREATE TABLE public.restaurante_usuarios (
    id integer NOT NULL,
    documento character varying(20) NOT NULL,
    celular character varying(20) NOT NULL,
    telefono character varying(20) NOT NULL,
    direccion character varying(200) NOT NULL,
    ubicacion character varying(100),
    user_id integer NOT NULL,
    foto character varying(100),
    visitante boolean NOT NULL
);
 (   DROP TABLE public.restaurante_usuarios;
       public         postgres    false            �            1259    167492    restaurante_usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.restaurante_usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.restaurante_usuarios_id_seq;
       public       postgres    false    231            �	           0    0    restaurante_usuarios_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.restaurante_usuarios_id_seq OWNED BY public.restaurante_usuarios.id;
            public       postgres    false    232            �            1259    167494    seguridad_audiusuariotabla    TABLE     �  CREATE TABLE public.seguridad_audiusuariotabla (
    id integer NOT NULL,
    tabla character varying(100) NOT NULL,
    registroid integer NOT NULL,
    registroname character varying(100) NOT NULL,
    accion character varying(10) NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    estacion character varying(100) NOT NULL,
    usuario_id integer NOT NULL
);
 .   DROP TABLE public.seguridad_audiusuariotabla;
       public         postgres    false            �            1259    167497 !   seguridad_audiusuariotabla_id_seq    SEQUENCE     �   CREATE SEQUENCE public.seguridad_audiusuariotabla_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.seguridad_audiusuariotabla_id_seq;
       public       postgres    false    233            �	           0    0 !   seguridad_audiusuariotabla_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.seguridad_audiusuariotabla_id_seq OWNED BY public.seguridad_audiusuariotabla.id;
            public       postgres    false    234            �            1259    167499    seguridad_correo    TABLE     �   CREATE TABLE public.seguridad_correo (
    id integer NOT NULL,
    correo character varying(100) NOT NULL,
    clave character varying(100) NOT NULL
);
 $   DROP TABLE public.seguridad_correo;
       public         postgres    false            �            1259    167502    seguridad_correo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.seguridad_correo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.seguridad_correo_id_seq;
       public       postgres    false    235            �	           0    0    seguridad_correo_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.seguridad_correo_id_seq OWNED BY public.seguridad_correo.id;
            public       postgres    false    236            �            1259    167504    seguridad_modulo    TABLE     ,  CREATE TABLE public.seguridad_modulo (
    id integer NOT NULL,
    url character varying(100) NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion character varying(100) NOT NULL,
    activo boolean NOT NULL,
    orden integer NOT NULL,
    icono character varying(100) NOT NULL
);
 $   DROP TABLE public.seguridad_modulo;
       public         postgres    false            �            1259    167507    seguridad_modulo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.seguridad_modulo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.seguridad_modulo_id_seq;
       public       postgres    false    237            �	           0    0    seguridad_modulo_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.seguridad_modulo_id_seq OWNED BY public.seguridad_modulo.id;
            public       postgres    false    238            �            1259    167509    seguridad_modulogrupo    TABLE     �   CREATE TABLE public.seguridad_modulogrupo (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion character varying(200) NOT NULL,
    icono character varying(100) NOT NULL,
    prioridad integer
);
 )   DROP TABLE public.seguridad_modulogrupo;
       public         postgres    false            �            1259    167512    seguridad_modulogrupo_grupos    TABLE     �   CREATE TABLE public.seguridad_modulogrupo_grupos (
    id integer NOT NULL,
    modulogrupo_id integer NOT NULL,
    group_id integer NOT NULL
);
 0   DROP TABLE public.seguridad_modulogrupo_grupos;
       public         postgres    false            �            1259    167515 #   seguridad_modulogrupo_grupos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.seguridad_modulogrupo_grupos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.seguridad_modulogrupo_grupos_id_seq;
       public       postgres    false    240            �	           0    0 #   seguridad_modulogrupo_grupos_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.seguridad_modulogrupo_grupos_id_seq OWNED BY public.seguridad_modulogrupo_grupos.id;
            public       postgres    false    241            �            1259    167517    seguridad_modulogrupo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.seguridad_modulogrupo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.seguridad_modulogrupo_id_seq;
       public       postgres    false    239            �	           0    0    seguridad_modulogrupo_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.seguridad_modulogrupo_id_seq OWNED BY public.seguridad_modulogrupo.id;
            public       postgres    false    242            �            1259    167519    seguridad_modulogrupo_modulos    TABLE     �   CREATE TABLE public.seguridad_modulogrupo_modulos (
    id integer NOT NULL,
    modulogrupo_id integer NOT NULL,
    modulo_id integer NOT NULL
);
 1   DROP TABLE public.seguridad_modulogrupo_modulos;
       public         postgres    false            �            1259    167522 $   seguridad_modulogrupo_modulos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.seguridad_modulogrupo_modulos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.seguridad_modulogrupo_modulos_id_seq;
       public       postgres    false    243            �	           0    0 $   seguridad_modulogrupo_modulos_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.seguridad_modulogrupo_modulos_id_seq OWNED BY public.seguridad_modulogrupo_modulos.id;
            public       postgres    false    244            }           2604    167524    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            ~           2604    167525    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198                       2604    167526    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200            �           2604    167527    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    202            �           2604    167528    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    203            �           2604    167529    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206            �           2604    167530    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208            �           2604    167531    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210            �           2604    167532    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    212            �           2604    167533     restaurante_calificacionlocal id    DEFAULT     �   ALTER TABLE ONLY public.restaurante_calificacionlocal ALTER COLUMN id SET DEFAULT nextval('public.restaurante_calificacionlocal_id_seq'::regclass);
 O   ALTER TABLE public.restaurante_calificacionlocal ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    216    215            �           2604    167534    restaurante_categoria id    DEFAULT     �   ALTER TABLE ONLY public.restaurante_categoria ALTER COLUMN id SET DEFAULT nextval('public.restaurante_categoria_id_seq'::regclass);
 G   ALTER TABLE public.restaurante_categoria ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    218    217            �           2604    167535    restaurante_dias id    DEFAULT     z   ALTER TABLE ONLY public.restaurante_dias ALTER COLUMN id SET DEFAULT nextval('public.restaurante_dias_id_seq'::regclass);
 B   ALTER TABLE public.restaurante_dias ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    220    219            �           2604    167536    restaurante_faq id    DEFAULT     x   ALTER TABLE ONLY public.restaurante_faq ALTER COLUMN id SET DEFAULT nextval('public.restaurante_faq_id_seq'::regclass);
 A   ALTER TABLE public.restaurante_faq ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    222    221            �           2604    167537    restaurante_horariolocal id    DEFAULT     �   ALTER TABLE ONLY public.restaurante_horariolocal ALTER COLUMN id SET DEFAULT nextval('public.restaurante_horariolocal_id_seq'::regclass);
 J   ALTER TABLE public.restaurante_horariolocal ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    224    223            �           2604    167538    restaurante_iplocalvisita id    DEFAULT     �   ALTER TABLE ONLY public.restaurante_iplocalvisita ALTER COLUMN id SET DEFAULT nextval('public.restaurante_iplocalvisita_id_seq'::regclass);
 K   ALTER TABLE public.restaurante_iplocalvisita ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    226    225            �           2604    167539    restaurante_local id    DEFAULT     |   ALTER TABLE ONLY public.restaurante_local ALTER COLUMN id SET DEFAULT nextval('public.restaurante_local_id_seq'::regclass);
 C   ALTER TABLE public.restaurante_local ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    228    227            �           2604    167540    restaurante_platos id    DEFAULT     ~   ALTER TABLE ONLY public.restaurante_platos ALTER COLUMN id SET DEFAULT nextval('public.restaurante_platos_id_seq'::regclass);
 D   ALTER TABLE public.restaurante_platos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    230    229            �           2604    167541    restaurante_usuarios id    DEFAULT     �   ALTER TABLE ONLY public.restaurante_usuarios ALTER COLUMN id SET DEFAULT nextval('public.restaurante_usuarios_id_seq'::regclass);
 F   ALTER TABLE public.restaurante_usuarios ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    232    231            �           2604    167542    seguridad_audiusuariotabla id    DEFAULT     �   ALTER TABLE ONLY public.seguridad_audiusuariotabla ALTER COLUMN id SET DEFAULT nextval('public.seguridad_audiusuariotabla_id_seq'::regclass);
 L   ALTER TABLE public.seguridad_audiusuariotabla ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    234    233            �           2604    167543    seguridad_correo id    DEFAULT     z   ALTER TABLE ONLY public.seguridad_correo ALTER COLUMN id SET DEFAULT nextval('public.seguridad_correo_id_seq'::regclass);
 B   ALTER TABLE public.seguridad_correo ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    236    235            �           2604    167544    seguridad_modulo id    DEFAULT     z   ALTER TABLE ONLY public.seguridad_modulo ALTER COLUMN id SET DEFAULT nextval('public.seguridad_modulo_id_seq'::regclass);
 B   ALTER TABLE public.seguridad_modulo ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    238    237            �           2604    167545    seguridad_modulogrupo id    DEFAULT     �   ALTER TABLE ONLY public.seguridad_modulogrupo ALTER COLUMN id SET DEFAULT nextval('public.seguridad_modulogrupo_id_seq'::regclass);
 G   ALTER TABLE public.seguridad_modulogrupo ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    242    239            �           2604    167546    seguridad_modulogrupo_grupos id    DEFAULT     �   ALTER TABLE ONLY public.seguridad_modulogrupo_grupos ALTER COLUMN id SET DEFAULT nextval('public.seguridad_modulogrupo_grupos_id_seq'::regclass);
 N   ALTER TABLE public.seguridad_modulogrupo_grupos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    241    240            �           2604    167547     seguridad_modulogrupo_modulos id    DEFAULT     �   ALTER TABLE ONLY public.seguridad_modulogrupo_modulos ALTER COLUMN id SET DEFAULT nextval('public.seguridad_modulogrupo_modulos_id_seq'::regclass);
 O   ALTER TABLE public.seguridad_modulogrupo_modulos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    244    243            �	          0    167379 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       postgres    false    196   �=      �	          0    167384    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       postgres    false    198   4>      �	          0    167389    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       postgres    false    200   m?      �	          0    167394 	   auth_user 
   TABLE DATA               �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       postgres    false    202   C      �	          0    167400    auth_user_groups 
   TABLE DATA               A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public       postgres    false    203   �C      �	          0    167407    auth_user_user_permissions 
   TABLE DATA               P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       postgres    false    206   �C      �	          0    167412    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       postgres    false    208   %E      �	          0    167421    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       postgres    false    210   L      �	          0    167426    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       postgres    false    212   M      �	          0    167434    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       postgres    false    214   >O      �	          0    167440    restaurante_calificacionlocal 
   TABLE DATA               _   COPY public.restaurante_calificacionlocal (id, calificacion, local_id, votante_id) FROM stdin;
    public       postgres    false    215   �W      �	          0    167445    restaurante_categoria 
   TABLE DATA               H   COPY public.restaurante_categoria (id, descripcion, estado) FROM stdin;
    public       postgres    false    217   �W      �	          0    167450    restaurante_dias 
   TABLE DATA               C   COPY public.restaurante_dias (id, descripcion, estado) FROM stdin;
    public       postgres    false    219   X      �	          0    167455    restaurante_faq 
   TABLE DATA               J   COPY public.restaurante_faq (id, pregunta, respuesta, estado) FROM stdin;
    public       postgres    false    221   zX      �	          0    167463    restaurante_horariolocal 
   TABLE DATA               q   COPY public.restaurante_horariolocal (id, dia_id, "horaInicio", "horaFin", local_id, estado, delete) FROM stdin;
    public       postgres    false    223   �X      �	          0    167468    restaurante_iplocalvisita 
   TABLE DATA               E   COPY public.restaurante_iplocalvisita (id, ip, local_id) FROM stdin;
    public       postgres    false    225   Y      �	          0    167473    restaurante_local 
   TABLE DATA               �   COPY public.restaurante_local (id, documento, razonsocial, "nombreComercial", fotouno, fotodos, direccion, telefono, correo, estado, categoria_id, propietario_id, descripcion, visita, valortotal, delete, oferta, ubicacion) FROM stdin;
    public       postgres    false    227    Y      �	          0    167481    restaurante_platos 
   TABLE DATA               �   COPY public.restaurante_platos (id, nombre, descripcion, descuento, precio, foto, oferta, estado, local_id, delete, preciooferta) FROM stdin;
    public       postgres    false    229   =Y      �	          0    167489    restaurante_usuarios 
   TABLE DATA               �   COPY public.restaurante_usuarios (id, documento, celular, telefono, direccion, ubicacion, user_id, foto, visitante) FROM stdin;
    public       postgres    false    231   ZY      �	          0    167494    seguridad_audiusuariotabla 
   TABLE DATA               �   COPY public.seguridad_audiusuariotabla (id, tabla, registroid, registroname, accion, fecha, hora, estacion, usuario_id) FROM stdin;
    public       postgres    false    233   �Y      �	          0    167499    seguridad_correo 
   TABLE DATA               =   COPY public.seguridad_correo (id, correo, clave) FROM stdin;
    public       postgres    false    235   2Z      �	          0    167504    seguridad_modulo 
   TABLE DATA               ^   COPY public.seguridad_modulo (id, url, nombre, descripcion, activo, orden, icono) FROM stdin;
    public       postgres    false    237   rZ      �	          0    167509    seguridad_modulogrupo 
   TABLE DATA               Z   COPY public.seguridad_modulogrupo (id, nombre, descripcion, icono, prioridad) FROM stdin;
    public       postgres    false    239   8[      �	          0    167512    seguridad_modulogrupo_grupos 
   TABLE DATA               T   COPY public.seguridad_modulogrupo_grupos (id, modulogrupo_id, group_id) FROM stdin;
    public       postgres    false    240   �[      �	          0    167519    seguridad_modulogrupo_modulos 
   TABLE DATA               V   COPY public.seguridad_modulogrupo_modulos (id, modulogrupo_id, modulo_id) FROM stdin;
    public       postgres    false    243   �[      �	           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);
            public       postgres    false    197            �	           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 88, true);
            public       postgres    false    199            �	           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 88, true);
            public       postgres    false    201            �	           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 11, true);
            public       postgres    false    204            �	           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 9, true);
            public       postgres    false    205            �	           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 88, true);
            public       postgres    false    207            �	           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 74, true);
            public       postgres    false    209            �	           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 22, true);
            public       postgres    false    211            �	           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 93, true);
            public       postgres    false    213            �	           0    0 $   restaurante_calificacionlocal_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.restaurante_calificacionlocal_id_seq', 8, true);
            public       postgres    false    216            �	           0    0    restaurante_categoria_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.restaurante_categoria_id_seq', 5, true);
            public       postgres    false    218            �	           0    0    restaurante_dias_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.restaurante_dias_id_seq', 8, true);
            public       postgres    false    220            �	           0    0    restaurante_faq_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.restaurante_faq_id_seq', 1, true);
            public       postgres    false    222            �	           0    0    restaurante_horariolocal_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.restaurante_horariolocal_id_seq', 23, true);
            public       postgres    false    224            �	           0    0     restaurante_iplocalvisita_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.restaurante_iplocalvisita_id_seq', 17, true);
            public       postgres    false    226            �	           0    0    restaurante_local_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.restaurante_local_id_seq', 8, true);
            public       postgres    false    228            �	           0    0    restaurante_platos_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.restaurante_platos_id_seq', 17, true);
            public       postgres    false    230            �	           0    0    restaurante_usuarios_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.restaurante_usuarios_id_seq', 9, true);
            public       postgres    false    232            �	           0    0 !   seguridad_audiusuariotabla_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.seguridad_audiusuariotabla_id_seq', 93, true);
            public       postgres    false    234            �	           0    0    seguridad_correo_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.seguridad_correo_id_seq', 1, true);
            public       postgres    false    236            �	           0    0    seguridad_modulo_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.seguridad_modulo_id_seq', 9, true);
            public       postgres    false    238            �	           0    0 #   seguridad_modulogrupo_grupos_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.seguridad_modulogrupo_grupos_id_seq', 3, true);
            public       postgres    false    241            �	           0    0    seguridad_modulogrupo_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.seguridad_modulogrupo_id_seq', 2, true);
            public       postgres    false    242            �	           0    0 $   seguridad_modulogrupo_modulos_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.seguridad_modulogrupo_modulos_id_seq', 10, true);
            public       postgres    false    244            �           2606    167549    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         postgres    false    196            �           2606    167551 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         postgres    false    198    198            �           2606    167553 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         postgres    false    198            �           2606    167555    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         postgres    false    196            �           2606    167557 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         postgres    false    200    200            �           2606    167559 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         postgres    false    200            �           2606    167561 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public         postgres    false    203            �           2606    167563 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public         postgres    false    203    203            �           2606    167565    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public         postgres    false    202            �           2606    167567 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public         postgres    false    206            �           2606    167569 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public         postgres    false    206    206            �           2606    167571     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public         postgres    false    202            �           2606    167573 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         postgres    false    208            �           2606    167575 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         postgres    false    210    210            �           2606    167577 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         postgres    false    210            �           2606    167579 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         postgres    false    212            �           2606    167581 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         postgres    false    214            �           2606    167583 @   restaurante_calificacionlocal restaurante_calificacionlocal_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.restaurante_calificacionlocal
    ADD CONSTRAINT restaurante_calificacionlocal_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.restaurante_calificacionlocal DROP CONSTRAINT restaurante_calificacionlocal_pkey;
       public         postgres    false    215            �           2606    167585 0   restaurante_categoria restaurante_categoria_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.restaurante_categoria
    ADD CONSTRAINT restaurante_categoria_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.restaurante_categoria DROP CONSTRAINT restaurante_categoria_pkey;
       public         postgres    false    217            �           2606    167587 &   restaurante_dias restaurante_dias_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.restaurante_dias
    ADD CONSTRAINT restaurante_dias_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.restaurante_dias DROP CONSTRAINT restaurante_dias_pkey;
       public         postgres    false    219            �           2606    167589 $   restaurante_faq restaurante_faq_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.restaurante_faq
    ADD CONSTRAINT restaurante_faq_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.restaurante_faq DROP CONSTRAINT restaurante_faq_pkey;
       public         postgres    false    221            �           2606    167591 6   restaurante_horariolocal restaurante_horariolocal_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.restaurante_horariolocal
    ADD CONSTRAINT restaurante_horariolocal_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.restaurante_horariolocal DROP CONSTRAINT restaurante_horariolocal_pkey;
       public         postgres    false    223            �           2606    167593 8   restaurante_iplocalvisita restaurante_iplocalvisita_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.restaurante_iplocalvisita
    ADD CONSTRAINT restaurante_iplocalvisita_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.restaurante_iplocalvisita DROP CONSTRAINT restaurante_iplocalvisita_pkey;
       public         postgres    false    225            �           2606    167595 (   restaurante_local restaurante_local_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.restaurante_local
    ADD CONSTRAINT restaurante_local_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.restaurante_local DROP CONSTRAINT restaurante_local_pkey;
       public         postgres    false    227            �           2606    167597 *   restaurante_platos restaurante_platos_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.restaurante_platos
    ADD CONSTRAINT restaurante_platos_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.restaurante_platos DROP CONSTRAINT restaurante_platos_pkey;
       public         postgres    false    229            �           2606    167599 .   restaurante_usuarios restaurante_usuarios_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.restaurante_usuarios
    ADD CONSTRAINT restaurante_usuarios_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.restaurante_usuarios DROP CONSTRAINT restaurante_usuarios_pkey;
       public         postgres    false    231            �           2606    167601 5   restaurante_usuarios restaurante_usuarios_user_id_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.restaurante_usuarios
    ADD CONSTRAINT restaurante_usuarios_user_id_key UNIQUE (user_id);
 _   ALTER TABLE ONLY public.restaurante_usuarios DROP CONSTRAINT restaurante_usuarios_user_id_key;
       public         postgres    false    231            �           2606    167603 :   seguridad_audiusuariotabla seguridad_audiusuariotabla_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.seguridad_audiusuariotabla
    ADD CONSTRAINT seguridad_audiusuariotabla_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.seguridad_audiusuariotabla DROP CONSTRAINT seguridad_audiusuariotabla_pkey;
       public         postgres    false    233            �           2606    167605 &   seguridad_correo seguridad_correo_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.seguridad_correo
    ADD CONSTRAINT seguridad_correo_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.seguridad_correo DROP CONSTRAINT seguridad_correo_pkey;
       public         postgres    false    235            �           2606    167607 &   seguridad_modulo seguridad_modulo_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.seguridad_modulo
    ADD CONSTRAINT seguridad_modulo_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.seguridad_modulo DROP CONSTRAINT seguridad_modulo_pkey;
       public         postgres    false    237            �           2606    167609 [   seguridad_modulogrupo_grupos seguridad_modulogrupo_gr_modulogrupo_id_group_id_39804e8c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.seguridad_modulogrupo_grupos
    ADD CONSTRAINT seguridad_modulogrupo_gr_modulogrupo_id_group_id_39804e8c_uniq UNIQUE (modulogrupo_id, group_id);
 �   ALTER TABLE ONLY public.seguridad_modulogrupo_grupos DROP CONSTRAINT seguridad_modulogrupo_gr_modulogrupo_id_group_id_39804e8c_uniq;
       public         postgres    false    240    240            �           2606    167611 >   seguridad_modulogrupo_grupos seguridad_modulogrupo_grupos_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.seguridad_modulogrupo_grupos
    ADD CONSTRAINT seguridad_modulogrupo_grupos_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.seguridad_modulogrupo_grupos DROP CONSTRAINT seguridad_modulogrupo_grupos_pkey;
       public         postgres    false    240            �           2606    167613 ]   seguridad_modulogrupo_modulos seguridad_modulogrupo_mo_modulogrupo_id_modulo_id_5f0beab4_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.seguridad_modulogrupo_modulos
    ADD CONSTRAINT seguridad_modulogrupo_mo_modulogrupo_id_modulo_id_5f0beab4_uniq UNIQUE (modulogrupo_id, modulo_id);
 �   ALTER TABLE ONLY public.seguridad_modulogrupo_modulos DROP CONSTRAINT seguridad_modulogrupo_mo_modulogrupo_id_modulo_id_5f0beab4_uniq;
       public         postgres    false    243    243            �           2606    167615 @   seguridad_modulogrupo_modulos seguridad_modulogrupo_modulos_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.seguridad_modulogrupo_modulos
    ADD CONSTRAINT seguridad_modulogrupo_modulos_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.seguridad_modulogrupo_modulos DROP CONSTRAINT seguridad_modulogrupo_modulos_pkey;
       public         postgres    false    243            �           2606    167617 0   seguridad_modulogrupo seguridad_modulogrupo_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.seguridad_modulogrupo
    ADD CONSTRAINT seguridad_modulogrupo_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.seguridad_modulogrupo DROP CONSTRAINT seguridad_modulogrupo_pkey;
       public         postgres    false    239            �           1259    167618    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         postgres    false    196            �           1259    167619 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         postgres    false    198            �           1259    167620 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         postgres    false    198            �           1259    167621 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         postgres    false    200            �           1259    167622 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public         postgres    false    203            �           1259    167623 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public         postgres    false    203            �           1259    167624 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public         postgres    false    206            �           1259    167625 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public         postgres    false    206            �           1259    167626     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public         postgres    false    202            �           1259    167627 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         postgres    false    208            �           1259    167628 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         postgres    false    208            �           1259    167629 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         postgres    false    214            �           1259    167630 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         postgres    false    214            �           1259    167631 /   restaurante_calificacionlocal_local_id_c92f3355    INDEX     }   CREATE INDEX restaurante_calificacionlocal_local_id_c92f3355 ON public.restaurante_calificacionlocal USING btree (local_id);
 C   DROP INDEX public.restaurante_calificacionlocal_local_id_c92f3355;
       public         postgres    false    215            �           1259    167632 1   restaurante_calificacionlocal_votante_id_b1366cee    INDEX     �   CREATE INDEX restaurante_calificacionlocal_votante_id_b1366cee ON public.restaurante_calificacionlocal USING btree (votante_id);
 E   DROP INDEX public.restaurante_calificacionlocal_votante_id_b1366cee;
       public         postgres    false    215            �           1259    167633 (   restaurante_horariolocal_dia_id_fd4d2a06    INDEX     o   CREATE INDEX restaurante_horariolocal_dia_id_fd4d2a06 ON public.restaurante_horariolocal USING btree (dia_id);
 <   DROP INDEX public.restaurante_horariolocal_dia_id_fd4d2a06;
       public         postgres    false    223            �           1259    167634 *   restaurante_horariolocal_local_id_4f8e74b0    INDEX     s   CREATE INDEX restaurante_horariolocal_local_id_4f8e74b0 ON public.restaurante_horariolocal USING btree (local_id);
 >   DROP INDEX public.restaurante_horariolocal_local_id_4f8e74b0;
       public         postgres    false    223            �           1259    167635 +   restaurante_iplocalvisita_local_id_1b4d5828    INDEX     u   CREATE INDEX restaurante_iplocalvisita_local_id_1b4d5828 ON public.restaurante_iplocalvisita USING btree (local_id);
 ?   DROP INDEX public.restaurante_iplocalvisita_local_id_1b4d5828;
       public         postgres    false    225            �           1259    167636 '   restaurante_local_categoria_id_c27e4718    INDEX     m   CREATE INDEX restaurante_local_categoria_id_c27e4718 ON public.restaurante_local USING btree (categoria_id);
 ;   DROP INDEX public.restaurante_local_categoria_id_c27e4718;
       public         postgres    false    227            �           1259    167637 )   restaurante_local_propietario_id_12dcffee    INDEX     q   CREATE INDEX restaurante_local_propietario_id_12dcffee ON public.restaurante_local USING btree (propietario_id);
 =   DROP INDEX public.restaurante_local_propietario_id_12dcffee;
       public         postgres    false    227            �           1259    167638 $   restaurante_platos_local_id_90d11810    INDEX     g   CREATE INDEX restaurante_platos_local_id_90d11810 ON public.restaurante_platos USING btree (local_id);
 8   DROP INDEX public.restaurante_platos_local_id_90d11810;
       public         postgres    false    229            �           1259    167639 .   seguridad_audiusuariotabla_usuario_id_f59e6313    INDEX     {   CREATE INDEX seguridad_audiusuariotabla_usuario_id_f59e6313 ON public.seguridad_audiusuariotabla USING btree (usuario_id);
 B   DROP INDEX public.seguridad_audiusuariotabla_usuario_id_f59e6313;
       public         postgres    false    233            �           1259    167640 .   seguridad_modulogrupo_grupos_group_id_40d7457a    INDEX     {   CREATE INDEX seguridad_modulogrupo_grupos_group_id_40d7457a ON public.seguridad_modulogrupo_grupos USING btree (group_id);
 B   DROP INDEX public.seguridad_modulogrupo_grupos_group_id_40d7457a;
       public         postgres    false    240            �           1259    167641 4   seguridad_modulogrupo_grupos_modulogrupo_id_974f850a    INDEX     �   CREATE INDEX seguridad_modulogrupo_grupos_modulogrupo_id_974f850a ON public.seguridad_modulogrupo_grupos USING btree (modulogrupo_id);
 H   DROP INDEX public.seguridad_modulogrupo_grupos_modulogrupo_id_974f850a;
       public         postgres    false    240            �           1259    167642 0   seguridad_modulogrupo_modulos_modulo_id_c594a82e    INDEX        CREATE INDEX seguridad_modulogrupo_modulos_modulo_id_c594a82e ON public.seguridad_modulogrupo_modulos USING btree (modulo_id);
 D   DROP INDEX public.seguridad_modulogrupo_modulos_modulo_id_c594a82e;
       public         postgres    false    243            �           1259    167643 5   seguridad_modulogrupo_modulos_modulogrupo_id_a61aca6a    INDEX     �   CREATE INDEX seguridad_modulogrupo_modulos_modulogrupo_id_a61aca6a ON public.seguridad_modulogrupo_modulos USING btree (modulogrupo_id);
 I   DROP INDEX public.seguridad_modulogrupo_modulos_modulogrupo_id_a61aca6a;
       public         postgres    false    243            �           2606    167644 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       postgres    false    198    2213    200            �           2606    167649 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       postgres    false    2202    198    196            �           2606    167654 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       postgres    false    200    210    2238            �           2606    167659 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       postgres    false    196    2202    203            �           2606    167664 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       postgres    false    2215    202    203            �           2606    167669 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public       postgres    false    200    206    2213            �           2606    167674 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       postgres    false    206    202    2215            �           2606    167679 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       postgres    false    210    2238    208            �           2606    167684 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public       postgres    false    208    202    2215            �           2606    167689 Q   restaurante_calificacionlocal restaurante_califica_local_id_c92f3355_fk_restauran    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurante_calificacionlocal
    ADD CONSTRAINT restaurante_califica_local_id_c92f3355_fk_restauran FOREIGN KEY (local_id) REFERENCES public.restaurante_local(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.restaurante_calificacionlocal DROP CONSTRAINT restaurante_califica_local_id_c92f3355_fk_restauran;
       public       postgres    false    215    227    2264             	           2606    167694 S   restaurante_calificacionlocal restaurante_califica_votante_id_b1366cee_fk_restauran    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurante_calificacionlocal
    ADD CONSTRAINT restaurante_califica_votante_id_b1366cee_fk_restauran FOREIGN KEY (votante_id) REFERENCES public.restaurante_usuarios(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.restaurante_calificacionlocal DROP CONSTRAINT restaurante_califica_votante_id_b1366cee_fk_restauran;
       public       postgres    false    215    231    2270            	           2606    167699 L   restaurante_horariolocal restaurante_horariol_local_id_4f8e74b0_fk_restauran    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurante_horariolocal
    ADD CONSTRAINT restaurante_horariol_local_id_4f8e74b0_fk_restauran FOREIGN KEY (local_id) REFERENCES public.restaurante_local(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.restaurante_horariolocal DROP CONSTRAINT restaurante_horariol_local_id_4f8e74b0_fk_restauran;
       public       postgres    false    223    227    2264            	           2606    167704 X   restaurante_horariolocal restaurante_horariolocal_dia_id_fd4d2a06_fk_restaurante_dias_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurante_horariolocal
    ADD CONSTRAINT restaurante_horariolocal_dia_id_fd4d2a06_fk_restaurante_dias_id FOREIGN KEY (dia_id) REFERENCES public.restaurante_dias(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.restaurante_horariolocal DROP CONSTRAINT restaurante_horariolocal_dia_id_fd4d2a06_fk_restaurante_dias_id;
       public       postgres    false    219    223    2252            	           2606    167709 M   restaurante_iplocalvisita restaurante_iplocalv_local_id_1b4d5828_fk_restauran    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurante_iplocalvisita
    ADD CONSTRAINT restaurante_iplocalv_local_id_1b4d5828_fk_restauran FOREIGN KEY (local_id) REFERENCES public.restaurante_local(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.restaurante_iplocalvisita DROP CONSTRAINT restaurante_iplocalv_local_id_1b4d5828_fk_restauran;
       public       postgres    false    225    2264    227            	           2606    167714 F   restaurante_local restaurante_local_categoria_id_c27e4718_fk_restauran    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurante_local
    ADD CONSTRAINT restaurante_local_categoria_id_c27e4718_fk_restauran FOREIGN KEY (categoria_id) REFERENCES public.restaurante_categoria(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.restaurante_local DROP CONSTRAINT restaurante_local_categoria_id_c27e4718_fk_restauran;
       public       postgres    false    227    2250    217            	           2606    167719 H   restaurante_local restaurante_local_propietario_id_12dcffee_fk_restauran    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurante_local
    ADD CONSTRAINT restaurante_local_propietario_id_12dcffee_fk_restauran FOREIGN KEY (propietario_id) REFERENCES public.restaurante_usuarios(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.restaurante_local DROP CONSTRAINT restaurante_local_propietario_id_12dcffee_fk_restauran;
       public       postgres    false    2270    231    227            	           2606    167724 O   restaurante_platos restaurante_platos_local_id_90d11810_fk_restaurante_local_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurante_platos
    ADD CONSTRAINT restaurante_platos_local_id_90d11810_fk_restaurante_local_id FOREIGN KEY (local_id) REFERENCES public.restaurante_local(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.restaurante_platos DROP CONSTRAINT restaurante_platos_local_id_90d11810_fk_restaurante_local_id;
       public       postgres    false    2264    227    229            	           2606    167729 J   restaurante_usuarios restaurante_usuarios_user_id_1ba9cd1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurante_usuarios
    ADD CONSTRAINT restaurante_usuarios_user_id_1ba9cd1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.restaurante_usuarios DROP CONSTRAINT restaurante_usuarios_user_id_1ba9cd1b_fk_auth_user_id;
       public       postgres    false    202    231    2215            	           2606    167734 Y   seguridad_audiusuariotabla seguridad_audiusuariotabla_usuario_id_f59e6313_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.seguridad_audiusuariotabla
    ADD CONSTRAINT seguridad_audiusuariotabla_usuario_id_f59e6313_fk_auth_user_id FOREIGN KEY (usuario_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.seguridad_audiusuariotabla DROP CONSTRAINT seguridad_audiusuariotabla_usuario_id_f59e6313_fk_auth_user_id;
       public       postgres    false    233    2215    202            	           2606    167739 R   seguridad_modulogrupo_modulos seguridad_modulogrup_modulo_id_c594a82e_fk_seguridad    FK CONSTRAINT     �   ALTER TABLE ONLY public.seguridad_modulogrupo_modulos
    ADD CONSTRAINT seguridad_modulogrup_modulo_id_c594a82e_fk_seguridad FOREIGN KEY (modulo_id) REFERENCES public.seguridad_modulo(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.seguridad_modulogrupo_modulos DROP CONSTRAINT seguridad_modulogrup_modulo_id_c594a82e_fk_seguridad;
       public       postgres    false    2279    237    243            		           2606    167744 V   seguridad_modulogrupo_grupos seguridad_modulogrup_modulogrupo_id_974f850a_fk_seguridad    FK CONSTRAINT     �   ALTER TABLE ONLY public.seguridad_modulogrupo_grupos
    ADD CONSTRAINT seguridad_modulogrup_modulogrupo_id_974f850a_fk_seguridad FOREIGN KEY (modulogrupo_id) REFERENCES public.seguridad_modulogrupo(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.seguridad_modulogrupo_grupos DROP CONSTRAINT seguridad_modulogrup_modulogrupo_id_974f850a_fk_seguridad;
       public       postgres    false    239    2281    240            	           2606    167749 W   seguridad_modulogrupo_modulos seguridad_modulogrup_modulogrupo_id_a61aca6a_fk_seguridad    FK CONSTRAINT     �   ALTER TABLE ONLY public.seguridad_modulogrupo_modulos
    ADD CONSTRAINT seguridad_modulogrup_modulogrupo_id_a61aca6a_fk_seguridad FOREIGN KEY (modulogrupo_id) REFERENCES public.seguridad_modulogrupo(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.seguridad_modulogrupo_modulos DROP CONSTRAINT seguridad_modulogrup_modulogrupo_id_a61aca6a_fk_seguridad;
       public       postgres    false    243    2281    239            
	           2606    167754 \   seguridad_modulogrupo_grupos seguridad_modulogrupo_grupos_group_id_40d7457a_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.seguridad_modulogrupo_grupos
    ADD CONSTRAINT seguridad_modulogrupo_grupos_group_id_40d7457a_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.seguridad_modulogrupo_grupos DROP CONSTRAINT seguridad_modulogrupo_grupos_group_id_40d7457a_fk_auth_group_id;
       public       postgres    false    2202    240    196            �	   '   x�3�u���2�tt����	rt������ y.+      �	   )  x�ҹq 1A[����\�➳�؅�~���N��eR/�~���a_.��Ŏ���&�a�	���Xa��1Q6�0[L�]\�\��z��������y��qy>�<_\�_B^B^!/^�_�Aȋ$�E�	y1��XB^\R^R^)/���of�В��E��&���rIyy)yu(ye��rJ^%���5%���WCɫ��ե�������iy��NZ^��~�mZ^-���ח�7��7��g�M0�&yS��y���0�fysYy{Xyk��uV�+o������f��������_��y_�      �	   �  x�u��n�0���S�	VH�U�.+����V^���$P ]���}����g�3��?����ܻ��U��ܜ6�u��Lb���qK�R>��V�b0�����A|���W_�S��}L������o�&�h���2�)�`�O�P���H�(�cLy�[k2�6��p�N�Id��PBR� HA�,&��ugv`z��N�OU���ܝ �����2l��"�\6�a��6�[[�=$�W��d�L���f<�|��3�*6�����ʦjޙ��S��ŋ��u� UDxҿ^ڮ�)��ҝm�F��h@j���$��� ��M�:ߌqs7��J��~5���%l�Ԍ�EQu���O)�n>|����ؒǮi}=L5s$YnӪ��F�ћ�*w4
��H�dS�بǳ�ތGx����p���a*rH�3���F��P�e��r�������鼳;%�v3�����m��>3�f�-���Z������<}��fZ����)�V[(��R��v�7�.!�j|��8������$�����DH<L�J�9�x�"���30tp"����[�*��5S���7��4D)c�
i��0�i�(�˯~�ޙo�6�����e�.�g.3��l�U.3��0����*?LC����oL�w�+d�����.��z#�_�*��{�s��³�N��e[G�l�B�fs��`�\6W^	L�ds!���>6gs���K��m��	�0@(c� aK��OU6�����7L5>�BYʴ;ʐ@��H;Bv�*��ͽ�/�'�beik�+�NO���z�¶P�I�-\�����3)��=�	_4P�Y���E����^t@�ϓ<��O�t�M�IS��f{P��o�E�����x.z���t;��~����O�!      �	   �   x�%��
�0���yx�l�eN2#*�~	dΙ�t�F��g���A��^�P<�&������C�z��.W��,�~�(�M�.�p��mrb�Z�s�D��3�o|� �� 	�4�</���'� Vum�R���h#�=C�i�7�H)
B�t�(ӱV�\u�c�*�����g]]˲��7      �	      x�3�4�4����� �Y      �	   )  x�ҹq 1A[����\�➳�؅�~���N��eR/�~���a_.��Ŏ���&�a�	���Xa��1Q6�0[L�]\�\��z��������y��qy>�<_\�_B^B^!/^�_�Aȋ$�E�	y1��XB^\R^R^)/���of�В��E��&���rIyy)yu(ye��rJ^%���5%���WCɫ��ե�������iy��NZ^��~�mZ^-���ח�7��7��g�M0�&yS��y���0�fysYy{Xyk��uV�+o������f��������_��y_�      �	   �  x����n�D�����rR�tuW�|��.�E{R��͂�36Y3�=�`�G@< �bT��dƧL�h�8��W��u�{ ��9��B�b�c�"˕��L��o!��H)�x��i��Yz��~��C`8�}��%F��q�1O��̊��Yf�]�|>BA(�C��QGL+��]>}�����.����8
)�GR��Qx�����ճW��o�n���֯�u�W�gUv[�y��[zq1�-M@�ʘE�A���e�!�,��^O���<B��G_O�X�E�jjF�6R���;T���v�@��Z� A���m���ͭ���g����w�XV�7�:;=OW��/�eQo+�TWY��6+�yU�Ŧ:���i	�zk��r<B�F�.�4��|��2�!R�H�����mn]���h�ۄ��Dpd�5�J|�0EЮ�_F�[G���_NMX���;B��$ui$��a.����m�?�u1����H������{�� bJs��"�7U��yq��}9�;fH��������;v���X���e?&�|��L�i�,�B���UV풺L6�,|Yl��F����X�H+�Y�R��d��v�V�s/�LG��!�����<u�z��>z�^�`EK=RQ��ʉ <`jgã�8t�Uĭfl$�0�gK�ݜ���w�i�S���kG8��r+�+{~>)�YI}bu>���m�鏤	U)է���$*�])�|�J�$\��*��CRn��p[�V�Y�x_7o9����aΓ�y��	0j�����t*v]I4�;w�@I��Hi�����h����E�:|��ח�SA�p*63��hE��z���8�&��H�he�������� ` ��~��� |�Km8W ߋ1�R#��_��b5�G:�h�Q�1~[gF�Sc/��h���p97�5��$c�A#�<V�ٕfբ̷�4m�5l�gs�s˔o�o)"s�`���R�0���ur���$`��0rɡI%<-H��Np/mȨHE�
\i�#��¾���"zY~�x̔C���c�"̈́����(_b�ncZ�d���MQv|��{�zzV!��ґK��ϋEBE�#����r� i��
���4�{��>D�(l�<��>ga�3��I�����G�`�������F5	*'j�Ƃ��M�{Oܰ�)"')��hF|H�F�o��iH�8���F�!�
	��>g~�/b��l�M�gK6¦a�H4�������p�\>:&�p�{wo��)���tk��FVc���E#�ӟᶾY�$�un�SP��b$cx�},��� ��$����jo[�������ޟpU@�]b��V>�,ª؄k�����Bb��J����&�ޜZ6��c�}3�5���������	�T���``��/����i�cDX3v\��f��D%Qg����r7��&���U*�{׆I���*M���e���;���ǤZt�'��bhK���e���hO�S!�N�ٌ�I�p�+
�(3��B~"���(״1Fw�a�ڬ�(Q�9Hf%�T�nV�qq�/�r\*5�ط�N�X��}:m�K�Wɖ~Lb�C!7R�8�|��=n�{����F���dy����r��nH7�Wn�I9�L%1Hw�[U���YsԮ>�}Aq�V�6t�!ǅ�"$�ifvo���ڑ���;J��@�	aU��o��/�a��Eix�F�6�����ΆOؠU�jI��<���LĄ�����jY�T�R��N�(+�������������      �	   �   x�e��n!E��c�B���n K�1�q��}�L+A��>?���t���<���C�7W��I�x��F&a+���,pp�����d�8:ͯj���$kEl�ڼ�3�vcA!ޤ�A2�UR��/3֕��F�yb!��Ʉ&w�dͧXa�N�,�����=�+�Z����a�D?V��M=��
��7BjK��B�]�����>R�!�1>ӕ"�v�팟o ��D��      �	   !  x����n�0���S��<���e%�"nj�CjL�}�5�)	*7ܘ���7cKR�}]���!��|��)(}r!��"�Z2��'	�����X���^[��0BUΰ5CM��R������Τ
zc����W[!)hl}ߙ���L���:Yx��B��3����3��ζn��	��"��D�݅��T�0��k���_/Y����ʅžY�>����Bf�Z(��2}r=�=���ܕ^��h�'�>�66;��"���B�����"8�7������uI�w%���W�0����`Z7��7z��8���K9�YF"pn�-$����
�3��ю�&7�r�y�
���Ɛ|\��p�s"��y1P
�Sr['��iiA�̠�$�j5C� �6`�4F�o��[�AC�
�3�
TXrɑe	�l!h�MZ��܃�}߿��J�\G��D!5��Ӱ��tCjۘq^Mu��6���n������	Ê�Rq`�%�lQ? � ��:T4AdI��w�Oy:���j��      �	   ^  x��ێ����;O���H��c�*2���7ƀ��������ekv2IzFs�'3-5��M�Wk�����8M�8{<�<u�2���L.�ަM��'��(��/�K3�� 2�7��kA�\��Zz�^x-<��`�E���K7۽�N/t�E/�2S��=��[�Y]Tȏۖ�-�(1e��L�n�޿<����[Da�I������:!�s�a�"ˤtO�E�|}�#��E�v�[�~�u�E�|�"�B��R�L�"2�Z����u��2_�~������~ �=�cL��a��w�9�NWz����6m��Ӊϗ�w��߱�c�F�eԵzvf��n���V�����䚝�TMr<������"\iA��p��T�P�/<UG3XG8-�^��nBe��؝���'��O�/O]��M�B�,!)p�`��lk(&��D���+WZղS]�W�4�FΦ�W&
��k��1vF��=;~�um��s[�I��Ǉ��^o�>�ۓm?�@��N�
�/�%�3�:D�L�țP���Tv�Yxs��#�/�����/l�������=>��Wm����'�幤�rKV�v2���ʭY�	;�����l��=���.f�2�~��4��M�_�:�MX̍�s�-;����d�0l#:��#��.�j.'1۞N�iN�҃e?�@��,��[vJ/�/
��5��:�!�|.��Q����+=���]�k.���w��Dfu��ȓ��
l��[�KX�%���=;�l˲����˱�PSn��X�Z�˅��7v=;��#2&��������Sz���l��ݴNW�77�F-'q������o�H��p�e�Ӓ,a�R�M,aV9�7Vܳ��g7/d�T]�##Dz<N:n�,B���40��"�\���F�{��1�`u��]���c�0Ȏ����<�D� �~T�������3>F���uYώݝt_������=T��E|KӬ�-�EOh�0p>^Y �N>�<8��}z�^���/��\��l�H��b}�k,��m���?��K&g�]���Da�%%��
aD�-;ֳ#ж�ȱ-Jw�y���͞ć�|`['���D_���a�ֳ;�9cu�8�d@���T�̱X�rt��!u�]�w��$��񄂵#�a��D`�����5�����2��`�����?�.��I��a�#oS
�p����*y&3�A�>R:�P�����Zpw���� �yui*��2O�O�Ң)+kG����% 0�d�!X���vW�
�0:���)�yk��c������XϦ]<��%�����  V�@�����(TDu�J��O춆��O^aS�E�c4������a4��Fvb�����9&8sk���k뜮�s���}�Y���7v�s4�˲��[L��XY�-Rl�Ϩ���uF�5w�%Z̦��`�Kj��F�M���#���,�e��#$�5��{#��7�;��ƀb�,�=K.	���$s.�񖻄�Uj��=���<� b���'aQa�Ee"X"���MA�+n
�$~^��z�k��|����ߢ�z���_{�6��u���7���O��W�Q:���Ŗ�쮤�{\��w�6/l�`�l+�8�L����~e�@i��F6!n��qg�K�@��Մn���=�]�=�������+;;rĢg�.]b�/�Ѫ���a����ڨF��moָg�y�(Xc4������X%�ݵ>�l���p��ۜn�8g6�]
if
cFE���\����$�((de�W�&�{�^x�����,���H��`�fnTP�H�p1���)$a�Pz9�7��}��}��8}�ٜy5�=��1�$�Pk{r*S���k��I�	dXѪ����!��U]/�Q)�a���N�* ���ʺ�� C�ĲS=�e"hx(���#��YB^��)u����B�k��M��="�]���e~V9�����s��s��ls[~=ſpg��
xcf�@&��O�ĵ��޲���U~������V�2���l�Y�KH���x����|[���ބ,<�':�?џ|�X�_m�����Bԟ��&PX�3A��@��L�&���ٺ^�et�
s�(K�c��;z��ݯ�2k      �	      x������ � �      �	   F   x�3��M,�,N�/�,�2�tJ,J�L8��s3S�/, �@!SN��$ ��3�ːӱ81%Č���� ��P      �	   K   x�3��)�K-�,�2��M,*3M8}3S���s�<SN���20ӌ3(Qo������dZp���f楃�1z\\\ I��      �	   \   x�3�<��9?��f��Ҥ����"��L�������|{N�����̒D�����⒢Ģ�T����T���ĂĢ�Ĕ|��BDA>g	W�        �	      x������ � �      �	      x������ � �      �	      x������ � �      �	      x������ � �      �	   k   x�M�1� F�N���/B��xM�13QG��K��k������P$'��l.2b�ɴ�3{Rp��L�B(T>r����]5��)-�,� �E��6�Qw����w2      �	   M   x��4���ON���tv"�Ԝ�\N#CK]C]#N#C+S+Cc=C#33sNCc �H���R��ԌӐ+F��� T��      �	   0   x�3����I-J�KL4�pH�M���K����HM.�/2313����� �L      �	   �   x�U���0�g�)�5 ~G������b�V)J�*vޟ����|w�= ��V�kB�N(�����5��[�hȻ�2@�*��������5��#�!u�,J�S��)W��mB�G�-̦�����,�CxF�Q����җ�`������|�pO �鞭���:g]A��e֔�mC�c~v�      �	   Q   x�3�NM/-�LILA�|�SJs�9��uK�S��9��8�R�KK��JRQ�i�E`�%�yř9ź�9%��\1z\\\ <,�      �	      x�3�4�4�2�4��@҈+F��� !��      �	   ,   x�3�4�4�2��\�F�f\@Ҝ�HZp )K�=... p4     