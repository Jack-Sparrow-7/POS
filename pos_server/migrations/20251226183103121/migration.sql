BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "store" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "store" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "email" text NOT NULL,
    "merchantId" uuid NOT NULL,
    "type" text,
    "storeId" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "store_name_merchant_idx" ON "store" USING btree ("name", "merchantId");

--
-- ACTION DROP TABLE
--
DROP TABLE "terminal" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "terminal" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "email" text NOT NULL,
    "storeId" text NOT NULL,
    "merchantId" uuid NOT NULL,
    "password" text NOT NULL,
    "terminalId" text NOT NULL,
    "terminalNumber" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "terminal_number_idx" ON "terminal" USING btree ("terminalNumber");
CREATE UNIQUE INDEX "terminal_name_store_idx" ON "terminal" USING btree ("name", "storeId");


--
-- MIGRATION VERSION FOR pos
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pos', '20251226183103121', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251226183103121', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20251208110420531-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110420531-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20251208110412389-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110412389-v3-0-0', "timestamp" = now();


COMMIT;
