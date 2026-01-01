BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "category" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "storeId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

--
-- ACTION DROP TABLE
--
DROP TABLE "counter" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "counter" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "merchantId" uuid NOT NULL,
    "storeId" bigint NOT NULL,
    "counterId" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "counter_name_store_idx" ON "counter" USING btree ("name", "storeId");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "store" DROP COLUMN "storeId";
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
    "storeId" bigint NOT NULL,
    "merchantId" uuid NOT NULL,
    "password" text NOT NULL,
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
    VALUES ('pos', '20251229104355383', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251229104355383', "timestamp" = now();

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
