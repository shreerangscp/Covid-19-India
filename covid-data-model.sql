create table country
(
	c_id number primary key,
	c_name varchar2(10) not null
);

create table region
(
    r_id number primary key,
	r_name varchar2(20) not null,
	r_c_id number
)

create table states
(
	s_id number primary key,
	s_name varchar2(50) not null,
	s_r_id number,
	s_c_id number,
	s_male_population number check (s_male_population >= 0),
	s_female_population number (s_female_population >= 0),
	s_total_population number (s_total_population >= 0)
)

create table districts
(
	d_id number primary key,
	d_s_id number,
	d_name varchar2(50) not null,
	d_key varchar2(30) not null
)

create table statewise_daily_stats
(
	sds_id number,
	sds_date date check (sds_date < (sysdate+1)),
	sds_s_id number,
	sds_total_confirmed number,
	sds_total_active number,
	sds_total_recovered number,
	sds_total_deaths number,
	sds_total_tests number,
	sds_confirmed number,
	sds_active number,
	sds_recovered number,
	sds_deaths number,
	sds_tests number,
	sds_first_dose number,
	sds_second_dose number,
	sds_total_dose number,
	sds_vaccine_administered_male number,
	sds_vaccine_administered_female number,
	sds_vaccine_administered_transgender number,
	sds_covaxin number,
	sds_covishield number,
	sds_sputnik number,
	sds_aefi number,
	sds_age_18_45 number,
	sds_age_45_60 number,
	sds_age_60_above number,
	sds_daily_administered number,
	constraint pk_sds primary key (sds_date,sds_s_id)
)
	
create table districtwise_stats
(
	ds_id number primary key,
	ds_d_id number,
	ds_confirmed number,
	ds_active number,
	ds_recovered number,
	ds_deaths number,
	ds_first_dose number,
	ds_second_dose number,
	ds_total_dose number,
	ds_vaccine_adminitered_male number,
	ds_vaccine_adminitered_female number,
	ds_vaccine_adminitered_transgender number,
	ds_covishield number,
	ds_covaxin number,
	ds_sputnik number
)

alter table region add foreign key (r_c_id) references country(c_id);

alter table states add foreign key (s_r_id) references region(r_id);
alter table states add foreign key (s_c_id) references country(c_id);

alter table districts add foreign key (d_s_id) references states(s_id);

alter table districtwise_stats add foreign key (ds_d_id) references districts(d_id);

alter table statewise_daily_stats add foreign key (sds_s_id) references states(s_id);
 
