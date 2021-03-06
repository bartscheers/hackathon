CREATE TABLE "runcat" (
	"id"               INTEGER       NOT NULL,
	"xtrsrc"           INTEGER       NOT NULL,
	"datapoints"       INTEGER       NOT NULL,
	"active"           BOOLEAN       NOT NULL,
	"avg_ra"           DOUBLE        NOT NULL,
	"avg_dec"          DOUBLE        NOT NULL,
	"avg_ra_deg"       DOUBLE        NOT NULL,
	"avg_dec_deg"      DOUBLE        NOT NULL,
	"avg_dec_zone_deg" TINYINT       NOT NULL,
	"x"                DOUBLE        NOT NULL,
	"y"                DOUBLE        NOT NULL,
	"z"                DOUBLE        NOT NULL
);

