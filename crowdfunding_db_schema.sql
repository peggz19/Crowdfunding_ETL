-- Dropping Tables in case I need to start over.

DROP TABLE IF EXISTS "crowdfunding_db"."public"."campaign" CASCADE;
DROP TABLE IF EXISTS "crowdfunding_db"."public"."category" CASCADE;
DROP TABLE IF EXISTS "crowdfunding_db"."public"."subcategory" CASCADE;
DROP TABLE IF EXISTS "crowdfunding_db"."public"."contacts" CASCADE;

--- DATA MODELING

CREATE TABLE "subcategory" (
    "subcategory_id" varchar   NOT NULL,
    "sub-category" varchar   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "category" (
    "category_id" varchar   NOT NULL,
    "category" varchar   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "contacts" (
    "contact_id" int   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "email" varchar   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar   NOT NULL,
    "description" varchar   NOT NULL,
    "goal" decimal   NOT NULL,
    "pledged" decimal   NOT NULL,
    "outcome" varchar   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar   NOT NULL,
    "currency" varchar   NOT NULL,
    "launched_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" varchar   NOT NULL,
    "subcategory_id" varchar   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

--- IMPORTING files
-- order : category, subcategory, contacts, campaign to respect PKs and FKs.

--DATA ENGINEERING
-- Listing each table
SELECT * from campaign --worked
SELECT * from category --worked
SELECT * from contacts --worked
SELECT * from subcategory --worked

