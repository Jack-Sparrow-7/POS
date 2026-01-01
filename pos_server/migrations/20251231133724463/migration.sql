BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "category" ALTER COLUMN "createdAt" DROP NOT NULL;
ALTER TABLE "category" ALTER COLUMN "updatedAt" DROP NOT NULL;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "counter" DROP COLUMN "counterId";
ALTER TABLE "counter" ALTER COLUMN "createdAt" DROP NOT NULL;
ALTER TABLE "counter" ALTER COLUMN "updatedAt" DROP NOT NULL;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "store" ALTER COLUMN "createdAt" DROP NOT NULL;
ALTER TABLE "store" ALTER COLUMN "updatedAt" DROP NOT NULL;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "terminal" ALTER COLUMN "password" DROP NOT NULL;
ALTER TABLE "terminal" ALTER COLUMN "createdAt" DROP NOT NULL;
ALTER TABLE "terminal" ALTER COLUMN "updatedAt" DROP NOT NULL;

--
-- MIGRATION VERSION FOR pos
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pos', '20251231133724463', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251231133724463', "timestamp" = now();

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
