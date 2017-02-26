
-- creating separate user for DB and granting all permissions to database and schema
CREATE USER db_login WITH password 'password';
GRANT ALL PRIVILEGES ON DATABASE "alexander" TO wave;

CREATE SCHEMA schema_name;
GRANT ALL PRIVILEGES ON SCHEMA wave TO wave;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA wave TO wave;
GRANT USAGE ON SCHEMA wave TO wave;

-- creating required tables
create table schema_name.job(id UUID, timestamp timestamp(6),file_path varchar(30),file_name varchar(30));
CREATE INDEX ON schema_name.job USING btree (id);

create table schema_name.employee_data(id bigserial,job_id UUID,date timestamp(6),category varchar(30),employee_name varchar(50),employee_address varchar(100),expense_description varchar(200),pre_tax_amnt numeric(12,2),tax_name varchar(30),tax_amnt numeric(10,2));
CREATE INDEX ON schema_name.employee_data USING btree (job_id);

ALTER TABLE "schema_name"."job" OWNER TO "db_login";
ALTER TABLE "schema_name"."employee_data" OWNER TO "db_login";

ANALYZE schema_name.job;
ANALYZE schema_name.employee_data;
