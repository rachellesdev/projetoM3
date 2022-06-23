SELECT * FROM steam.steam;
SELECT * FROM steam.steam_description_data;
SELECT * FROM steam.steam_media_data;
SELECT * FROM steam.steam_requirements_data;
SELECT * FROM steam.steam_support_info;

ALTER TABLE steam
ADD PRIMARY KEY (appid);

ALTER TABLE steam_description_data
ADD FOREIGN KEY (steam_appid) REFERENCES steam(appid);
/*
insert into steam (appid, name)
(select smd.steam_appid, smd.steam_appid from steam_description_data smd
left join steam s on s.appid = smd.steam_appid
where s.name is null)
*/

ALTER TABLE steam_media_data
ADD PRIMARY KEY (steam_appid);

ALTER TABLE steam_media_data
ADD FOREIGN KEY (steam_appid) REFERENCES steam(appid); 

ALTER TABLE steam_media_data 
ADD INDEX fk_steam_media_data_steam_idx (steam_appid ASC) VISIBLE;

ALTER TABLE steam_media_data 
ADD CONSTRAINT fk_steam_media_data_steam
  FOREIGN KEY (steam_appid)
  REFERENCES steam (appid)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

/*
select * from steam_media_data
insert into steam (appid, name)
(select smd.steam_appid, smd.steam_appid from steam_media_data smd
left join steam s on s.appid = smd.steam_appid
where s.name is null)
*/

ALTER TABLE steam_requirements_data
ADD FOREIGN KEY (steam_appid) REFERENCES steam(appid);

ALTER TABLE steam_requirements_data 
ADD CONSTRAINT fk_steam_requirements_data_steam
  FOREIGN KEY (steam_appid)
  REFERENCES steam (appid)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE steam_support_info
ADD FOREIGN KEY (steam_appid) REFERENCES steam(appid); 

ALTER TABLE steam_description_data
ADD PRIMARY KEY (steam_appid);

ALTER TABLE steam_media_data
ADD PRIMARY KEY (steam_appid);

ALTER TABLE steam_requirements_data
ADD PRIMARY KEY (steam_appid);

ALTER TABLE steam_support_info
ADD PRIMARY KEY (steam_appid);

ALTER TABLE steamspy_tag_data
ADD PRIMARY KEY (appid);
