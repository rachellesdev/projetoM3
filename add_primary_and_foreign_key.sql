SELECT * FROM steam.steam;
SELECT * FROM steam.steam_description_data;
SELECT * FROM steam.steam_media_data;
SELECT * FROM steam.steam_requirements_data;
SELECT * FROM steam.steam_support_info;

ALTER TABLE steam
ADD PRIMARY KEY (appid);

ALTER TABLE steam_description_data
ADD FOREIGN KEY (steam_appid) REFERENCES steam(appid);

ALTER TABLE steam_media_data
ADD FOREIGN KEY (steam_appid) REFERENCES steam(appid); #dando erro

ALTER TABLE steam_requirements_data
ADD FOREIGN KEY (steam_appid) REFERENCES steam(appid);

ALTER TABLE steam_support_info
ADD FOREIGN KEY (steam_appid) REFERENCES steam(appid); #dando erro
