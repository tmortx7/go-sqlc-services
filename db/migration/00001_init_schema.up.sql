CREATE TABLE "action_required" (
  "id" bigserial PRIMARY KEY,
  "call_id" bigint,
  "action_catalog_id" bigint,
  "notes" varchar
);

CREATE TABLE "call" (
  "id" bigserial PRIMARY KEY,
  "operator_id" bigint,
  "phone_number_id" bigint,
  "city_id" bigint,
  "notes" varchar NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "action_catalog" (
  "id" bigserial PRIMARY KEY,
  "action_name" varchar NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "alerted_service" (
  "id" bigserial PRIMARY KEY,
  "action_required_id" bigint,
  "emergency_service_id" bigint
);

CREATE TABLE "emergency_service" (
  "id" bigserial PRIMARY KEY,
  "service_name" varchar NOT NULL,
  "contact_detail" varchar NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "alert_service" (
  "id" bigserial PRIMARY KEY,
  "action_catalog_id" bigint,
  "emergency_service_id" bigint,
  "always_alert" boolean
);

CREATE TABLE "operator" (
  "id" bigserial PRIMARY KEY,
  "operator_code" varchar,
  "operator" varchar NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "city" (
  "id" bigserial PRIMARY KEY,
  "city_name" varchar NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "phone_number" (
  "id" bigserial PRIMARY KEY,
  "phone_number" varchar NOT NULL,
  "notes" varchar,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);
CREATE TABLE "users" (
  "username" varchar PRIMARY KEY,
  "hashed_password" varchar NOT NULL,
  "full_name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password_changed_at" timestamptz NOT NULL DEFAULT('0001-01-01 00:00:00Z'),
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "sessions" (
  "id" uuid PRIMARY KEY,
  "username" varchar NOT NULL,
  "refresh_token" varchar NOT NULL,
  "user_agent" varchar NOT NULL,
  "client_ip" varchar NOT NULL,
  "is_blocked" boolean NOT NULL DEFAULT false,
  "expires_at" timestamptz NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

ALTER TABLE "sessions" ADD FOREIGN KEY ("username") REFERENCES "users" ("username");

ALTER TABLE "operator" ADD FOREIGN KEY ("operator") REFERENCES "users" ("username");

ALTER TABLE "action_required" ADD FOREIGN KEY ("call_id") REFERENCES "call" ("id");

ALTER TABLE "action_required" ADD FOREIGN KEY ("action_catalog_id") REFERENCES "action_catalog" ("id");

ALTER TABLE "call" ADD FOREIGN KEY ("operator_id") REFERENCES "operator" ("id");

ALTER TABLE "call" ADD FOREIGN KEY ("phone_number_id") REFERENCES "phone_number" ("id");

ALTER TABLE "call" ADD FOREIGN KEY ("city_id") REFERENCES "city" ("id");

ALTER TABLE "alerted_service" ADD FOREIGN KEY ("action_required_id") REFERENCES "action_required" ("id");

ALTER TABLE "alerted_service" ADD FOREIGN KEY ("emergency_service_id") REFERENCES "emergency_service" ("id");

ALTER TABLE "alert_service" ADD FOREIGN KEY ("action_catalog_id") REFERENCES "action_catalog" ("id");

ALTER TABLE "alert_service" ADD FOREIGN KEY ("emergency_service_id") REFERENCES "emergency_service" ("id");
