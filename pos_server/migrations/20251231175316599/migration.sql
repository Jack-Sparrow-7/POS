BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "product" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "product" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "basePrice" bigint NOT NULL,
    "sellingPrice" bigint NOT NULL,
    "imageUrl" text,
    "categoryId" bigint NOT NULL,
    "counterId" bigint NOT NULL,
    "storeId" bigint NOT NULL,
    "merchantId" uuid NOT NULL,
    "stockMonitor" boolean NOT NULL,
    "stockQuantity" bigint NOT NULL,
    "lowStockQuantity" bigint NOT NULL,
    "status" text NOT NULL,
    "sessionInfo" json,
    "createdAt" timestamp without time zone,
    "updatedAt" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "product_name_store_idx" ON "product" USING btree ("name", "storeId");
CREATE INDEX "product_store_status_idx" ON "product" USING btree ("storeId", "status");
CREATE INDEX "product_category_store_idx" ON "product" USING btree ("categoryId", "storeId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "stock_log" (
    "id" bigserial PRIMARY KEY,
    "storeId" bigint NOT NULL,
    "productId" bigint NOT NULL,
    "movementType" text NOT NULL,
    "quantity" bigint NOT NULL,
    "referenceType" text NOT NULL,
    "orderId" bigint,
    "remarks" text,
    "stockBefore" bigint NOT NULL,
    "stockAfter" bigint NOT NULL,
    "movementAt" timestamp without time zone NOT NULL,
    "createdAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "stocklog_store_product_date_idx" ON "stock_log" USING btree ("storeId", "productId", "movementAt");
CREATE INDEX "stocklog_product_date_idx" ON "stock_log" USING btree ("productId", "movementAt");
CREATE INDEX "stocklog_reference_idx" ON "stock_log" USING btree ("referenceType", "orderId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "product"
    ADD CONSTRAINT "product_fk_0"
    FOREIGN KEY("categoryId")
    REFERENCES "category"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "product"
    ADD CONSTRAINT "product_fk_1"
    FOREIGN KEY("counterId")
    REFERENCES "counter"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "product"
    ADD CONSTRAINT "product_fk_2"
    FOREIGN KEY("storeId")
    REFERENCES "store"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "stock_log"
    ADD CONSTRAINT "stock_log_fk_0"
    FOREIGN KEY("storeId")
    REFERENCES "store"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "stock_log"
    ADD CONSTRAINT "stock_log_fk_1"
    FOREIGN KEY("productId")
    REFERENCES "product"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR pos
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pos', '20251231175316599', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251231175316599', "timestamp" = now();

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
