BEGIN TRANSACTION;
CREATE TABLE "clients" (client TEXT PRIMARY KEY, protocol TEXT, district TEXT, known_pos INTEGER);
INSERT INTO "clients" VALUES('n1','legacy','bay',5);
INSERT INTO "clients" VALUES('n2','legacy','bay',5);
CREATE TABLE "jobs_base" (job_key TEXT PRIMARY KEY, district TEXT, category TEXT, site_code TEXT);
INSERT INTO "jobs_base" VALUES('Q1','bay','maker','B-1');
COMMIT;
