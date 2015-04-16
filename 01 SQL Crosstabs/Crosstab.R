dfrank <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"select TYPE, ZIP, PRICE, RANK() OVER (PARTITION BY TYPE, ZIP ORDER BY PRICE DESC) AS RANK from RE ORDER BY TYPE, ZIP"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_js64948', PASS='orcl_js64948', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))

dfmax <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query="SELECT TYPE, ZIP, PRICE, 
MAX(PRICE) OVER (PARTITION BY TYPE, ZIP ORDER BY PRICE DESC) AS MAX_PRICE, MAX(PRICE) OVER (PARTITION BY TYPE, ZIP ORDER BY PRICE DESC) - PRICE AS CALCULATION                 FROM RE ORDER BY TYPE, ZIP, PRICE"')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_js64948', PASS='orcl_js64948', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))

dfnth <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query="SELECT * FROM (SELECT TYPE, ZIP, PRICE, RANK() OVER (PARTITION BY TYPE, ZIP ORDER BY PRICE DESC) NTH                                                   FROM RE ORDER BY TYPE, ZIP) T WHERE NTH = 3"')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_js64948', PASS='orcl_js64948', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))

dfcume <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query="SELECT TYPE, ZIP, PRICE,  
(100.0 * (PRICE) / (MAX(PRICE) OVER (PARTITION BY TYPE, ZIP ORDER BY PRICE DESC))) AS CALCULATION                                   
FROM RE ORDER BY TYPE, ZIP, PRICE"')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_js64948', PASS='orcl_js64948', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))
