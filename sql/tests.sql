create extension timestampandtz;

set time zone 'US/Eastern';
select '9-18-2014 8:15pm'::timestampandtz;
set time zone 'US/Pacific';
select '9-18-2014 8:15pm'::timestampandtz;

select '9-18-2014 8:15pm @ US/Eastern'::timestampandtz;
select '9-18-2014 8:15pm @ US/Pacific'::timestampandtz;
select '9-18-2014 8:15pm @ foobar'::timestampandtz;

select '9-18-2014 8:15pm @ US/Eastern'::timestampandtz::timestamp;
select '9-18-2014 8:15pm @ US/Pacific'::timestampandtz::timestamp;

set time zone 'US/Eastern';
select '9-18-2014 8:15pm @ US/Eastern'::timestampandtz::timestamptz;
select '9-18-2014 8:15pm @ US/Pacific'::timestampandtz::timestamptz;

select '9-18-2014 8:15pm @ US/Eastern'::timestampandtz + interval '3 hours';
select '9-18-2014 8:15pm @ US/Pacific'::timestampandtz + interval '3 hours';
select '9-18-2014 8:15pm @ US/Eastern'::timestampandtz + interval '3 days';
select '9-18-2014 8:15pm @ US/Pacific'::timestampandtz + interval '3 days';
select '9-18-2014 8:15pm @ US/Eastern'::timestampandtz + interval '3 months';
select '9-18-2014 8:15pm @ US/Pacific'::timestampandtz + interval '3 months';

select ('9-18-2014 8:15pm @ US/Eastern'::timestampandtz + interval '3 hours') at time zone 'utc';
select ('9-18-2014 8:15pm @ US/Pacific'::timestampandtz + interval '3 hours') at time zone 'utc';
select ('9-18-2014 8:15pm @ US/Eastern'::timestampandtz + interval '3 days') at time zone 'utc';
select ('9-18-2014 8:15pm @ US/Pacific'::timestampandtz + interval '3 days') at time zone 'utc';
select ('9-18-2014 8:15pm @ US/Eastern'::timestampandtz + interval '3 months') at time zone 'utc';
select ('9-18-2014 8:15pm @ US/Pacific'::timestampandtz + interval '3 months') at time zone 'utc';

select '12-18-2014 8:15pm @ US/Eastern'::timestampandtz - interval '3 hours';
select '12-18-2014 8:15pm @ US/Pacific'::timestampandtz - interval '3 hours';
select '12-18-2014 8:15pm @ US/Eastern'::timestampandtz - interval '3 months';
select '12-18-2014 8:15pm @ US/Pacific'::timestampandtz - interval '3 months';

select ('12-18-2014 8:15pm @ US/Eastern'::timestampandtz - interval '3 hours') at time zone 'utc';
select ('12-18-2014 8:15pm @ US/Pacific'::timestampandtz - interval '3 hours') at time zone 'utc';
select ('12-18-2014 8:15pm @ US/Eastern'::timestampandtz - interval '3 months') at time zone 'utc';
select ('12-18-2014 8:15pm @ US/Pacific'::timestampandtz - interval '3 months') at time zone 'utc';

create table times (dt timestampandtz);
create index ix_times_dt on times (dt);

insert into times values ('9-18-2014 8:15pm @ US/Eastern');
insert into times values ('9-18-2014 5:16pm @ US/Pacific');
insert into times values ('9-18-2014 8:17pm @ US/Eastern');
insert into times values ('9-18-2014 7:18pm @ US/Central');
insert into times values('9-18-2014 20:19'::timestamptz);
insert into times values('9-18-2014 20:20'::timestamp);

select dt,dt::timestamp,dt::timestamptz from times order by times.dt asc;
select dt,dt at time zone 'US/Eastern' from times order by times.dt asc;
select dt,dt at time zone 'US/Central' from times order by times.dt asc;

select tzmove('9-18-2014 8:15pm @ US/Eastern'::timestampandtz, 'US/Eastern');
select tzmove('9-18-2014 8:15pm @ US/Eastern'::timestampandtz, 'US/Pacific');
select tzmove('9-18-2014 8:15pm @ US/Eastern'::timestampandtz, 'foobar');

select to_char('09-18-2014 8:15pm'::timestampandtz, 'DD Mon YYYY HH12:MI:SSam');
select to_char('09-18-2014 8:15pm'::timestampandtz, 'DD Mon YYYY HH12:MI:SSam TZ');
select to_char('09-18-2014 8:15pm @ US/Central'::timestampandtz, 'DD Mon YYYY HH12:MI:SSam');
select to_char('09-18-2014 8:15pm @ US/Central'::timestampandtz, 'DD Mon YYYY HH12:MI:SSam TZ');
select to_char('12-18-2014 8:15pm'::timestampandtz, 'DD Mon YYYY HH12:MI:SSam');
select to_char('12-18-2014 8:15pm'::timestampandtz, 'DD Mon YYYY HH12:MI:SSam TZ');
select to_char('12-18-2014 8:15pm @ US/Central'::timestampandtz, 'DD Mon YYYY HH12:MI:SSam');
select to_char('12-18-2014 8:15pm @ US/Central'::timestampandtz, 'DD Mon YYYY HH12:MI:SSam TZ');

select '09-18-2014 8:15:19.12345678'::timestampandtz(-1);
select '09-18-2014 8:15:19.12345678'::timestampandtz(7);
select '09-18-2014 8:15:19.12345678'::timestampandtz(6);
select '09-18-2014 8:15:19.12345678'::timestampandtz(5);
select '09-18-2014 8:15:19.12345678'::timestampandtz(4);
select '09-18-2014 8:15:19.12345678'::timestampandtz(3);
select '09-18-2014 8:15:19.12345678'::timestampandtz(2);
select '09-18-2014 8:15:19.12345678'::timestampandtz(1);
select '09-18-2014 8:15:19.12345678'::timestampandtz(0);

select '8/1/2014 8:15 @ US/Pacific'::timestampandtz - '8/1/2014 8:15 @ US/Eastern'::timestampandtz;
select '8/1/2014 8:15 @ US/Pacific'::timestampandtz - '8/1/2014 11:15 @ US/Eastern'::timestampandtz;
select '12/1/2014 8:15 @ US/Eastern'::timestampandtz - '10/1/2014 8:15 @ US/Eastern'::timestampandtz;

select date_trunc('hour', '8/15/2014 8:15 @ US/Eastern'::timestampandtz);
select date_trunc('hour', '8/15/2014 8:15 @ US/Pacific'::timestampandtz);
select date_trunc('day', '8/15/2014 8:15 @ US/Eastern'::timestampandtz);
select date_trunc('day', '8/15/2014 8:15 @ US/Pacific'::timestampandtz);
select date_trunc('month', '8/15/2014 8:15 @ US/Eastern'::timestampandtz);
select date_trunc('month', '8/15/2014 8:15 @ US/Pacific'::timestampandtz);

select date_trunc_at('day', '2014-09-15 20:15:00 @ US/Pacific', 'US/Eastern');
select date_trunc_at('day', '2014-09-15 23:15:00 @ US/Pacific', 'US/Eastern');

select date_part('hour', '9/1/2015 8:15am @ US/Eastern'::timestampandtz);
select date_part('hour', '9/1/2015 8:15am @ US/Pacific'::timestampandtz);

select '8/15/2014'::timestampandtz='8/15/2014'::date;
select '8/15/2014 @ US/Eastern'::timestampandtz='8/15/2014'::date;
select '8/15/2014 @ US/Pacific'::timestampandtz='8/15/2014'::date;

select '8/15/2014 9:15pm'::timestampandtz::date='8/15/2014'::date;
select '8/15/2014 9:15pm @ US/Eastern'::timestampandtz::date='8/15/2014'::date;
select '8/15/2014 9:15pm @ US/Pacific'::timestampandtz::date='8/15/2014'::date;

select to_char('8/15/2014 9:15pm @ US/Eastern'::timestampandtz, 'HH24:MI YYYY-MM-DD');
select to_char('8/15/2014 9:15pm @ US/Pacific'::timestampandtz, 'HH24:MI YYYY-MM-DD');
