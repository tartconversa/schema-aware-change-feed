BEGIN TRANSACTION;
CREATE TABLE "clients" (client TEXT PRIMARY KEY, protocol TEXT, district TEXT, known_pos INTEGER);
INSERT INTO "clients" VALUES('search','current','east',NULL);
INSERT INTO "clients" VALUES('stats','legacy','east',6);
CREATE TABLE "jobs_base" (job_key TEXT PRIMARY KEY, district TEXT, category TEXT, site_code TEXT);
INSERT INTO "jobs_base" VALUES('J1','east','maker','A-1');
INSERT INTO "jobs_base" VALUES('J2','east','care','A-2');
INSERT INTO "jobs_base" VALUES('J3','south','care','C-1');
COMMIT;
