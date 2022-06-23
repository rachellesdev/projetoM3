#Quantos jogos possuem mais de uma forma de suporte técnico? 
SELECT 
	count(1) as total,
    (SELECT count(1) from steam_support_info where support_email != '') as total_with_email,
        (SELECT count(1) from steam_support_info where support_url != '') as total_with_url,
          (SELECT count(1) from steam_support_info where website  != '') as total_with_website,
                (SELECT count(1) from steam_support_info where website  != '' AND support_url != '' AND support_email != '') as total_complete
FROM steam_support_info;