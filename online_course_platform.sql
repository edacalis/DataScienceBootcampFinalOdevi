PGDMP      +                }            online_course_platform    17.3    17.3 0    c           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            d           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            e           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            f           1262    17302    online_course_platform    DATABASE     |   CREATE DATABASE online_course_platform WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'tr-TR';
 &   DROP DATABASE online_course_platform;
                     postgres    false            �            1259    17385 
   blog_posts    TABLE     �   CREATE TABLE public.blog_posts (
    blog_id integer NOT NULL,
    author_information integer,
    title character varying(255),
    content text,
    publication_date timestamp without time zone
);
    DROP TABLE public.blog_posts;
       public         heap r       postgres    false            �            1259    17384    blog_posts_blog_id_seq    SEQUENCE     �   CREATE SEQUENCE public.blog_posts_blog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.blog_posts_blog_id_seq;
       public               postgres    false    226            g           0    0    blog_posts_blog_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.blog_posts_blog_id_seq OWNED BY public.blog_posts.blog_id;
          public               postgres    false    225            �            1259    17323 
   categories    TABLE     y   CREATE TABLE public.categories (
    category_id smallint NOT NULL,
    category_name character varying(100) NOT NULL
);
    DROP TABLE public.categories;
       public         heap r       postgres    false            �            1259    17369    certificate_assignments    TABLE     �   CREATE TABLE public.certificate_assignments (
    member_id integer NOT NULL,
    certificate_id integer NOT NULL,
    receiving_date date
);
 +   DROP TABLE public.certificate_assignments;
       public         heap r       postgres    false            �            1259    17362    certificates    TABLE     �   CREATE TABLE public.certificates (
    certificate_id integer NOT NULL,
    certificate_code character varying(100) NOT NULL,
    issue_date date
);
     DROP TABLE public.certificates;
       public         heap r       postgres    false            �            1259    17330    course_category    TABLE     k   CREATE TABLE public.course_category (
    course_id integer NOT NULL,
    category_id smallint NOT NULL
);
 #   DROP TABLE public.course_category;
       public         heap r       postgres    false            �            1259    17314    courses    TABLE     �   CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course_name character varying(200) NOT NULL,
    explanation text,
    start_date date,
    finish_date date,
    instructor_information character varying(100)
);
    DROP TABLE public.courses;
       public         heap r       postgres    false            �            1259    17346    enrollments    TABLE     �   CREATE TABLE public.enrollments (
    enrollment_id integer NOT NULL,
    member_id integer,
    course_id integer,
    participation_date timestamp without time zone
);
    DROP TABLE public.enrollments;
       public         heap r       postgres    false            �            1259    17345    enrollments_enrollment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.enrollments_enrollment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.enrollments_enrollment_id_seq;
       public               postgres    false    222            h           0    0    enrollments_enrollment_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.enrollments_enrollment_id_seq OWNED BY public.enrollments.enrollment_id;
          public               postgres    false    221            �            1259    17303    members    TABLE     G  CREATE TABLE public.members (
    member_id integer NOT NULL,
    user_name character varying(50) NOT NULL,
    e_posta character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    registration_date timestamp without time zone,
    first_name character varying(50),
    last_name character varying(50)
);
    DROP TABLE public.members;
       public         heap r       postgres    false            �           2604    17388    blog_posts blog_id    DEFAULT     x   ALTER TABLE ONLY public.blog_posts ALTER COLUMN blog_id SET DEFAULT nextval('public.blog_posts_blog_id_seq'::regclass);
 A   ALTER TABLE public.blog_posts ALTER COLUMN blog_id DROP DEFAULT;
       public               postgres    false    226    225    226            �           2604    17349    enrollments enrollment_id    DEFAULT     �   ALTER TABLE ONLY public.enrollments ALTER COLUMN enrollment_id SET DEFAULT nextval('public.enrollments_enrollment_id_seq'::regclass);
 H   ALTER TABLE public.enrollments ALTER COLUMN enrollment_id DROP DEFAULT;
       public               postgres    false    222    221    222            `          0    17385 
   blog_posts 
   TABLE DATA           c   COPY public.blog_posts (blog_id, author_information, title, content, publication_date) FROM stdin;
    public               postgres    false    226   �=       Y          0    17323 
   categories 
   TABLE DATA           @   COPY public.categories (category_id, category_name) FROM stdin;
    public               postgres    false    219   �=       ^          0    17369    certificate_assignments 
   TABLE DATA           \   COPY public.certificate_assignments (member_id, certificate_id, receiving_date) FROM stdin;
    public               postgres    false    224   >       ]          0    17362    certificates 
   TABLE DATA           T   COPY public.certificates (certificate_id, certificate_code, issue_date) FROM stdin;
    public               postgres    false    223   3>       Z          0    17330    course_category 
   TABLE DATA           A   COPY public.course_category (course_id, category_id) FROM stdin;
    public               postgres    false    220   P>       X          0    17314    courses 
   TABLE DATA           w   COPY public.courses (course_id, course_name, explanation, start_date, finish_date, instructor_information) FROM stdin;
    public               postgres    false    218   m>       \          0    17346    enrollments 
   TABLE DATA           ^   COPY public.enrollments (enrollment_id, member_id, course_id, participation_date) FROM stdin;
    public               postgres    false    222   �>       W          0    17303    members 
   TABLE DATA           t   COPY public.members (member_id, user_name, e_posta, password, registration_date, first_name, last_name) FROM stdin;
    public               postgres    false    217   �>       i           0    0    blog_posts_blog_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.blog_posts_blog_id_seq', 1, false);
          public               postgres    false    225            j           0    0    enrollments_enrollment_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.enrollments_enrollment_id_seq', 1, false);
          public               postgres    false    221            �           2606    17392    blog_posts blog_posts_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.blog_posts
    ADD CONSTRAINT blog_posts_pkey PRIMARY KEY (blog_id);
 D   ALTER TABLE ONLY public.blog_posts DROP CONSTRAINT blog_posts_pkey;
       public                 postgres    false    226            �           2606    17329 '   categories categories_category_name_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_category_name_key UNIQUE (category_name);
 Q   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_category_name_key;
       public                 postgres    false    219            �           2606    17327    categories categories_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public                 postgres    false    219            �           2606    17373 4   certificate_assignments certificate_assignments_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.certificate_assignments
    ADD CONSTRAINT certificate_assignments_pkey PRIMARY KEY (member_id, certificate_id);
 ^   ALTER TABLE ONLY public.certificate_assignments DROP CONSTRAINT certificate_assignments_pkey;
       public                 postgres    false    224    224            �           2606    17368 .   certificates certificates_certificate_code_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT certificates_certificate_code_key UNIQUE (certificate_code);
 X   ALTER TABLE ONLY public.certificates DROP CONSTRAINT certificates_certificate_code_key;
       public                 postgres    false    223            �           2606    17366    certificates certificates_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT certificates_pkey PRIMARY KEY (certificate_id);
 H   ALTER TABLE ONLY public.certificates DROP CONSTRAINT certificates_pkey;
       public                 postgres    false    223            �           2606    17334 $   course_category course_category_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.course_category
    ADD CONSTRAINT course_category_pkey PRIMARY KEY (course_id, category_id);
 N   ALTER TABLE ONLY public.course_category DROP CONSTRAINT course_category_pkey;
       public                 postgres    false    220    220            �           2606    17322    courses courses_course_name_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_course_name_key UNIQUE (course_name);
 I   ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_course_name_key;
       public                 postgres    false    218            �           2606    17320    courses courses_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);
 >   ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_pkey;
       public                 postgres    false    218            �           2606    17351    enrollments enrollments_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (enrollment_id);
 F   ALTER TABLE ONLY public.enrollments DROP CONSTRAINT enrollments_pkey;
       public                 postgres    false    222            �           2606    17313    members members_e_posta_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_e_posta_key UNIQUE (e_posta);
 E   ALTER TABLE ONLY public.members DROP CONSTRAINT members_e_posta_key;
       public                 postgres    false    217            �           2606    17309    members members_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (member_id);
 >   ALTER TABLE ONLY public.members DROP CONSTRAINT members_pkey;
       public                 postgres    false    217            �           2606    17311    members members_user_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_user_name_key UNIQUE (user_name);
 G   ALTER TABLE ONLY public.members DROP CONSTRAINT members_user_name_key;
       public                 postgres    false    217            �           2606    17393 -   blog_posts blog_posts_author_information_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.blog_posts
    ADD CONSTRAINT blog_posts_author_information_fkey FOREIGN KEY (author_information) REFERENCES public.members(member_id);
 W   ALTER TABLE ONLY public.blog_posts DROP CONSTRAINT blog_posts_author_information_fkey;
       public               postgres    false    217    4776    226            �           2606    17379 C   certificate_assignments certificate_assignments_certificate_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.certificate_assignments
    ADD CONSTRAINT certificate_assignments_certificate_id_fkey FOREIGN KEY (certificate_id) REFERENCES public.certificates(certificate_id);
 m   ALTER TABLE ONLY public.certificate_assignments DROP CONSTRAINT certificate_assignments_certificate_id_fkey;
       public               postgres    false    223    4794    224            �           2606    17374 >   certificate_assignments certificate_assignments_member_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.certificate_assignments
    ADD CONSTRAINT certificate_assignments_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(member_id);
 h   ALTER TABLE ONLY public.certificate_assignments DROP CONSTRAINT certificate_assignments_member_id_fkey;
       public               postgres    false    4776    217    224            �           2606    17340 0   course_category course_category_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_category
    ADD CONSTRAINT course_category_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id);
 Z   ALTER TABLE ONLY public.course_category DROP CONSTRAINT course_category_category_id_fkey;
       public               postgres    false    219    220    4786            �           2606    17335 .   course_category course_category_course_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_category
    ADD CONSTRAINT course_category_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);
 X   ALTER TABLE ONLY public.course_category DROP CONSTRAINT course_category_course_id_fkey;
       public               postgres    false    218    220    4782            �           2606    17357 &   enrollments enrollments_course_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);
 P   ALTER TABLE ONLY public.enrollments DROP CONSTRAINT enrollments_course_id_fkey;
       public               postgres    false    218    4782    222            �           2606    17352 &   enrollments enrollments_member_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(member_id);
 P   ALTER TABLE ONLY public.enrollments DROP CONSTRAINT enrollments_member_id_fkey;
       public               postgres    false    4776    222    217            `      x������ � �      Y      x������ � �      ^      x������ � �      ]      x������ � �      Z      x������ � �      X      x������ � �      \      x������ � �      W      x������ � �     