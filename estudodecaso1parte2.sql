PGDMP     6                	    z            estudodecaso1    14.5    14.4     $           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            %           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            &           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            '           1262    16387    estudodecaso1    DATABASE     b   CREATE DATABASE estudodecaso1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE estudodecaso1;
                postgres    false            ?            1259    16388    clientes    TABLE     i   CREATE TABLE public.clientes (
    cpf integer NOT NULL,
    nome "char",
    data_nascimento integer
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            ?            1259    16391    hoteis    TABLE     {   CREATE TABLE public.hoteis (
    cnpj integer NOT NULL,
    nome character varying,
    endereco character varying(200)
);
    DROP TABLE public.hoteis;
       public         heap    postgres    false            ?            1259    16396    quartos    TABLE     |   CREATE TABLE public.quartos (
    numero integer NOT NULL,
    situacao boolean,
    tipo "char",
    cnpj_hotel integer
);
    DROP TABLE public.quartos;
       public         heap    postgres    false            ?            1259    16399    quartosvalores    TABLE     ?   CREATE TABLE public.quartosvalores (
    numero_quarto integer NOT NULL,
    data_inicio date,
    data_fim date,
    preco integer NOT NULL
);
 "   DROP TABLE public.quartosvalores;
       public         heap    postgres    false            ?            1259    16402    reservas    TABLE     ?   CREATE TABLE public.reservas (
    data_ini date NOT NULL,
    data_fim date NOT NULL,
    cpf_cliente integer NOT NULL,
    valor integer NOT NULL,
    numero_quarto integer NOT NULL,
    preco_diaria integer,
    valor_reserva integer
);
    DROP TABLE public.reservas;
       public         heap    postgres    false            ?            1259    16438 
   restricoes    TABLE     ?   CREATE TABLE public.restricoes (
    cpf_cliente integer NOT NULL,
    tipo_restricao "char" NOT NULL,
    data_registro date NOT NULL,
    data_cancelamento date
);
    DROP TABLE public.restricoes;
       public         heap    postgres    false            ?            1259    16435    tipo_restricao    TABLE     \   CREATE TABLE public.tipo_restricao (
    "ID" integer,
    "Nome" character varying(100)
);
 "   DROP TABLE public.tipo_restricao;
       public         heap    postgres    false                      0    16388    clientes 
   TABLE DATA           >   COPY public.clientes (cpf, nome, data_nascimento) FROM stdin;
    public          postgres    false    209   T                 0    16391    hoteis 
   TABLE DATA           6   COPY public.hoteis (cnpj, nome, endereco) FROM stdin;
    public          postgres    false    210   q                 0    16396    quartos 
   TABLE DATA           E   COPY public.quartos (numero, situacao, tipo, cnpj_hotel) FROM stdin;
    public          postgres    false    211   ?                 0    16399    quartosvalores 
   TABLE DATA           U   COPY public.quartosvalores (numero_quarto, data_inicio, data_fim, preco) FROM stdin;
    public          postgres    false    212   ?                 0    16402    reservas 
   TABLE DATA           v   COPY public.reservas (data_ini, data_fim, cpf_cliente, valor, numero_quarto, preco_diaria, valor_reserva) FROM stdin;
    public          postgres    false    213   ?       !          0    16438 
   restricoes 
   TABLE DATA           c   COPY public.restricoes (cpf_cliente, tipo_restricao, data_registro, data_cancelamento) FROM stdin;
    public          postgres    false    215   ?                  0    16435    tipo_restricao 
   TABLE DATA           6   COPY public.tipo_restricao ("ID", "Nome") FROM stdin;
    public          postgres    false    214           ?           2606    16406    clientes Clientes_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT "Clientes_pkey" PRIMARY KEY (cpf);
 B   ALTER TABLE ONLY public.clientes DROP CONSTRAINT "Clientes_pkey";
       public            postgres    false    209            ?           2606    16408    quartos Quartos_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.quartos
    ADD CONSTRAINT "Quartos_pkey" PRIMARY KEY (numero);
 @   ALTER TABLE ONLY public.quartos DROP CONSTRAINT "Quartos_pkey";
       public            postgres    false    211            ?           2606    16410    reservas Reservas_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT "Reservas_pkey" PRIMARY KEY (data_ini, data_fim, cpf_cliente, valor, numero_quarto);
 B   ALTER TABLE ONLY public.reservas DROP CONSTRAINT "Reservas_pkey";
       public            postgres    false    213    213    213    213    213            ?           2606    16412    hoteis hoteis_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.hoteis
    ADD CONSTRAINT hoteis_pkey PRIMARY KEY (cnpj);
 <   ALTER TABLE ONLY public.hoteis DROP CONSTRAINT hoteis_pkey;
       public            postgres    false    210            ?           2606    16414 #   quartosvalores quartos_valores_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.quartosvalores
    ADD CONSTRAINT quartos_valores_pkey PRIMARY KEY (numero_quarto, preco);
 M   ALTER TABLE ONLY public.quartosvalores DROP CONSTRAINT quartos_valores_pkey;
       public            postgres    false    212    212            ?           2606    16442    restricoes restricoes_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public.restricoes
    ADD CONSTRAINT restricoes_pkey PRIMARY KEY (cpf_cliente, tipo_restricao, data_registro);
 D   ALTER TABLE ONLY public.restricoes DROP CONSTRAINT restricoes_pkey;
       public            postgres    false    215    215    215            ?           2606    16415    quartos cnpj_hotel    FK CONSTRAINT     w   ALTER TABLE ONLY public.quartos
    ADD CONSTRAINT cnpj_hotel FOREIGN KEY (cnpj_hotel) REFERENCES public.hoteis(cnpj);
 <   ALTER TABLE ONLY public.quartos DROP CONSTRAINT cnpj_hotel;
       public          postgres    false    211    3459    210            ?           2606    16420    reservas cpf_cliente    FK CONSTRAINT     {   ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT cpf_cliente FOREIGN KEY (cpf_cliente) REFERENCES public.clientes(cpf);
 >   ALTER TABLE ONLY public.reservas DROP CONSTRAINT cpf_cliente;
       public          postgres    false    3457    209    213            ?           2606    16425    reservas numero_quarto    FK CONSTRAINT     ?   ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT numero_quarto FOREIGN KEY (numero_quarto) REFERENCES public.quartos(numero);
 @   ALTER TABLE ONLY public.reservas DROP CONSTRAINT numero_quarto;
       public          postgres    false    213    211    3461            ?           2606    16430    quartosvalores numero_quarto    FK CONSTRAINT     ?   ALTER TABLE ONLY public.quartosvalores
    ADD CONSTRAINT numero_quarto FOREIGN KEY (numero_quarto) REFERENCES public.quartos(numero);
 F   ALTER TABLE ONLY public.quartosvalores DROP CONSTRAINT numero_quarto;
       public          postgres    false    212    211    3461                  x?????? ? ?            x?????? ? ?            x?????? ? ?            x?????? ? ?            x?????? ? ?      !      x?????? ? ?             x?????? ? ?     