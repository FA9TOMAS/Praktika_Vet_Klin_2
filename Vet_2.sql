-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public."Хозяин"
(
    "id хозяина" integer NOT NULL,
    "Имя" text COLLATE pg_catalog."default",
    "Фамилия" text COLLATE pg_catalog."default",
    "Номер телефона" text,
    CONSTRAINT "Хозяин_pkey" PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS public."Наблюдение за стоянием животного"
(
    "id состояния" integer NOT NULL,
    "id животного" integer,
    "Вес (кг)" double precision,
    "Температура (Цельсия)" double precision,
    "Состояние здоровья" text COLLATE pg_catalog."default",
    "id карточки болезни" integer,
    "id наблюдающего сотрудника" integer,
    "id сотрудника назначающего лекарства" integer,
    CONSTRAINT "Наблюдение за стоянием животно_pkey" PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS public."Сотрудники"
(
    "id сотрудника" integer NOT NULL,
    "Имя" text COLLATE pg_catalog."default",
    "Фамилия" text COLLATE pg_catalog."default",
    "Должность" text COLLATE pg_catalog."default",
    "Дата трудоустройства" date,
    CONSTRAINT "Сотрудники_pkey" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."Лекарство"
(
    "id лекарства" integer NOT NULL,
    "Название" text COLLATE pg_catalog."default",
    "Дозировка (Миллилитрах)" double precision,
    "Дата изготовления" date,
    CONSTRAINT "Лекарство_pkey" PRIMARY KEY ("Id ")
);

CREATE TABLE IF NOT EXISTS public."Животные"
(
    "id животного" integer NOT NULL,
    "Вид" text COLLATE pg_catalog."default",
    "Порода" integer COLLATE pg_catalog."default",
    "Кличка" text COLLATE pg_catalog."default",
    "Половая принадлежность" text COLLATE pg_catalog."default",
    "Дата рождения" date,
    CONSTRAINT "Животные_pkey" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."Карточка болезни"
(
    "id карточки" integer NOT NULL,
    "id животного" integer,
    "id хозяина" integer,
    "id сотрудника" integer,
    "id состояния" integer,
    "Дата осмотра" date,
    "id назначенных лекарств" integer,
    PRIMARY KEY ("id карточки")
);

CREATE TABLE IF NOT EXISTS public."Назначенные лекарства"
(
    "id назначенных лекарств" integer NOT NULL,
    "id лекарства" integer,
    "id состояния" integer,
    PRIMARY KEY (None)
);

ALTER TABLE IF EXISTS public."Наблюдение за стоянием животного"
    ADD FOREIGN KEY ("id животного")
    REFERENCES public."Животные" ("id животного") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Наблюдение за стоянием животного"
    ADD FOREIGN KEY ("id наблюдающего сотрудника")
    REFERENCES public."Сотрудники" ("id сотрудника") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Наблюдение за стоянием животного"
    ADD FOREIGN KEY ("id сотрудника назначающего лекарства")
    REFERENCES public."Сотрудники" ("id сотрудника") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Наблюдение за стоянием животного"
    ADD FOREIGN KEY ("id карточки болезни")
    REFERENCES public."Карточка болезни" ("id карточки") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Карточка болезни"
    ADD FOREIGN KEY ("id хозяина")
    REFERENCES public."Хозяин" ("id хозяина") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Карточка болезни"
    ADD FOREIGN KEY ("id сотрудника")
    REFERENCES public."Сотрудники" ("id сотрудника") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Карточка болезни"
    ADD FOREIGN KEY ("id состояния")
    REFERENCES public."Наблюдение за стоянием животного" ("id состояния") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Карточка болезни"
    ADD FOREIGN KEY ("id животного")
    REFERENCES public."Животные" ("id животного") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Карточка болезни"
    ADD FOREIGN KEY ("id назначенных лекарств")
    REFERENCES public."Назначенные лекарства" ("id назначенных лекарств") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Назначенные лекарства"
    ADD FOREIGN KEY ("id лекарства")
    REFERENCES public."Лекарство" ("id лекарства") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Назначенные лекарства"
    ADD FOREIGN KEY ("id состояния")
    REFERENCES public."Наблюдение за стоянием животного" ("id состояния") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;