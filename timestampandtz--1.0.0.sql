create type timestampandtz;
create function timestampandtz_in(cstring, oid, integer) returns timestampandtz as 'timestampandtz.so' LANGUAGE C IMMUTABLE STRICT;
create function timestampandtz_out(timestampandtz) returns cstring as 'timestampandtz.so' LANGUAGE C IMMUTABLE STRICT;
create function timestampandtz_recv(internal, oid, integer) returns timestampandtz as 'timestampandtz.so' LANGUAGE C IMMUTABLE STRICT;
create function timestampandtz_send(timestampandtz) returns bytea as 'timestampandtz.so' LANGUAGE C IMMUTABLE STRICT;
create function timestampandtz_typmodin(cstring[]) returns integer as 'timestampandtz.so' LANGUAGE C IMMUTABLE STRICT;
create function timestampandtz_typmodout(integer) returns cstring as 'timestampandtz.so' LANGUAGE C IMMUTABLE STRICT;
create type timestampandtz (
	internallength = 10,
	input = timestampandtz_in,
	output = timestampandtz_out,
	send = timestampandtz_send,
	receive = timestampandtz_recv,
	typmod_in = timestampandtz_typmodin,
	typmod_out = timestampandtz_typmodout
);

create function pg_catalog.timezone(text, timestampandtz) returns timestamp as 'timestampandtz.so', 'timestampandtz_timezone' LANGUAGE C IMMUTABLE STRICT;
create function timestampandtz_to_timestamptz(timestampandtz) returns timestamptz as 'timestampandtz.so' language C immutable strict;
create function timestampandtz_to_timestamp(timestampandtz) returns timestamp as 'timestampandtz.so' language C immutable strict;
create function timestamptz_to_timestampandtz(timestamptz) returns timestampandtz as 'timestampandtz.so' language C immutable strict;
create function timestamp_to_timestampandtz(timestamp) returns timestampandtz as 'timestampandtz.so' language C immutable strict;
create function timestampandtz_to_date(timestampandtz) returns date as 'timestampandtz.so' language C immutable strict;
create function timestampandtz_cmp(timestampandtz, timestampandtz) returns int4 as 'timestampandtz.so' language C immutable strict;
create function timestampandtz_pl_interval(timestampandtz, interval) returns timestampandtz as 'timestampandtz.so' language C immutable strict;
create function timestampandtz_mi_interval(timestampandtz, interval) returns timestampandtz as 'timestampandtz.so' language C immutable strict;
create function timestampandtz_mi(timestampandtz, timestampandtz) returns interval as 'timestampandtz.so' language C immutable strict;
create function tzmove(timestampandtz, text) returns timestampandtz as 'timestampandtz.so', 'timestampandtz_movetz' language C immutable strict;
create function to_char(timestampandtz, text) returns text as 'timestampandtz.so', 'timestampandtz_to_char' language C strict;
create function timestampandtz_scale(timestampandtz, integer) returns timestampandtz as 'timestampandtz.so' language C immutable strict;
create function date_part(text, timestampandtz) returns float8 as 'timestampandtz.so', 'timestampandtz_part' language C immutable strict;
create function date_trunc(text, timestampandtz) returns timestampandtz as 'timestampandtz.so', 'timestampandtz_trunc' language C immutable strict;
create function date_trunc_at(text, timestampandtz, text) returns timestampandtz as 'timestampandtz.so', 'timestampandtz_trunc_at' language C immutable strict;

create function timestampandtz_larger(timestampandtz, timestampandtz) returns timestampandtz as 'timestampandtz.so' language C immutable strict;
create function timestampandtz_smaller(timestampandtz, timestampandtz) returns timestampandtz as 'timestampandtz.so' language C immutable strict;
create function timestampandtz_eq(timestampandtz, timestampandtz) returns boolean as 'timestampandtz.so' language C immutable strict;
create function timestampandtz_ne(timestampandtz, timestampandtz) returns boolean as 'timestampandtz.so' language C immutable strict;
create function timestampandtz_lt(timestampandtz, timestampandtz) returns boolean as 'timestampandtz.so' language C immutable strict;
create function timestampandtz_le(timestampandtz, timestampandtz) returns boolean as 'timestampandtz.so' language C immutable strict;
create function timestampandtz_gt(timestampandtz, timestampandtz) returns boolean as 'timestampandtz.so' language C immutable strict;
create function timestampandtz_ge(timestampandtz, timestampandtz) returns boolean as 'timestampandtz.so' language C immutable strict;
create operator = ( leftarg = timestampandtz, rightarg = timestampandtz, procedure = timestampandtz_eq, negator = operator(<>) );
create operator <> ( leftarg = timestampandtz, rightarg = timestampandtz, procedure = timestampandtz_ne, negator = operator(=) );
create operator < ( leftarg = timestampandtz, rightarg = timestampandtz, procedure = timestampandtz_lt );
create operator <= ( leftarg = timestampandtz, rightarg = timestampandtz, procedure = timestampandtz_le );
create operator > ( leftarg = timestampandtz, rightarg = timestampandtz, procedure = timestampandtz_gt );
create operator >= ( leftarg = timestampandtz, rightarg = timestampandtz, procedure = timestampandtz_ge );

create function timestampandtz_eq_date(timestampandtz, date) returns boolean as 'timestampandtz.so' language C immutable strict;
create function timestampandtz_ne_date(timestampandtz, date) returns boolean as 'timestampandtz.so' language C immutable strict;
create function timestampandtz_lt_date(timestampandtz, date) returns boolean as 'timestampandtz.so' language C immutable strict;
create function timestampandtz_le_date(timestampandtz, date) returns boolean as 'timestampandtz.so' language C immutable strict;
create function timestampandtz_gt_date(timestampandtz, date) returns boolean as 'timestampandtz.so' language C immutable strict;
create function timestampandtz_ge_date(timestampandtz, date) returns boolean as 'timestampandtz.so' language C immutable strict;
create operator = ( leftarg = timestampandtz, rightarg = date, procedure = timestampandtz_eq_date, negator = operator(<>) );
create operator <> ( leftarg = timestampandtz, rightarg = date, procedure = timestampandtz_ne_date, negator = operator(=) );
create operator < ( leftarg = timestampandtz, rightarg = date, procedure = timestampandtz_lt_date, commutator = operator(>) );
create operator <= ( leftarg = timestampandtz, rightarg = date, procedure = timestampandtz_le_date );
create operator > ( leftarg = timestampandtz, rightarg = date, procedure = timestampandtz_gt_date, commutator = operator(<) );
create operator >= ( leftarg = timestampandtz, rightarg = date, procedure = timestampandtz_ge_date );

create operator + ( leftarg = timestampandtz, rightarg = interval, procedure = timestampandtz_pl_interval );
create operator - ( leftarg = timestampandtz, rightarg = interval, procedure = timestampandtz_mi_interval );
create operator - ( leftarg = timestampandtz, rightarg = timestampandtz, procedure = timestampandtz_mi );
create cast(timestampandtz as timestamptz) with function timestampandtz_to_timestamptz(timestampandtz) as implicit;
create cast(timestampandtz as timestamp) with function timestampandtz_to_timestamp(timestampandtz) as implicit;
create cast(timestamptz as timestampandtz) with function timestamptz_to_timestampandtz(timestamptz) as implicit;
create cast(timestamp as timestampandtz) with function timestamp_to_timestampandtz(timestamp) as implicit;
create cast(timestampandtz as timestampandtz) with function timestampandtz_scale(timestampandtz, integer) as implicit;
create cast(timestampandtz as date) with function timestampandtz_to_date(timestampandtz) as implicit;
create operator class timestampandtz_ops default for type timestampandtz using btree as
	operator 1 <, operator 2 <=, operator 3 =, operator 4 >=, operator 5 >,
	function 1 timestampandtz_cmp( timestampandtz, timestampandtz );
create aggregate max(timestampandtz) ( sfunc = timestampandtz_larger, stype = timestampandtz );
create aggregate min(timestampandtz) ( sfunc = timestampandtz_smaller, stype = timestampandtz );
