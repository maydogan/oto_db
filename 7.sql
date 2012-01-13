---***************************************************************************************************---
-- 1
---***************************************************************************************************---
--- Fiyat aralığı 0-700000 olan aracların fiyat ve modellerini göster 

select fiyat, model_ad from model
where (fiyat > 0) and (fiyat < 700000)


---***************************************************************************************************---
-- 2
---***************************************************************************************************---
--- Araba modellerinin en eskiden en yeniye doğru üretim yıllarını göster

select model_ad, model_yili from model
order by model_yili ASC


---***************************************************************************************************---
-- 3
---***************************************************************************************************---
--- Vites türü otomatik olan modelleri göster

select model_ad
from model
where vites_turu = "otomatik"


---***************************************************************************************************---
-- 4
---***************************************************************************************************---
--- Ödeme şeklini kredi kartı olarak belirleyen müşterinin adını ve soyadını göster

select ad, soyad
from musteri
where user_id IN (
	select user_id
	from odeme
	where odeme_sekli = "kredi karti"
);


---*************************************************************************************************---
-- 5
---*************************************************************************************************---
--- Marka adi hummer olan oto modellerinin tüm özelliklerini göster

select *
from model
where model_id IN (
	select model_id from marka
	where
		marka_adi = 'hummer'

);



---***************************************************************************************************---
-- 6
---***************************************************************************************************---
--- Adı 'eylul', soyadı 'akbas' olan satıcının sattığı aracların markalarını göster

select marka_id, marka_adi from marka
where marka_id IN(
select marka_id 
from arac
where satici_id IN(
	select satici_id 
	from satici
	where 	ad = 'eylul' and soyad = 'akbas'
	
       )
);


---***************************************************************************************************---
-- 7
---***************************************************************************************************---
--- Marka adı 'porsche' olan aracların ödeme şekillerini göster

select odeme_sekli
from odeme
where arac_id IN (
	select arac_id
	from arac
		where marka_id in (
		select marka_id 
		from marka
		where
			marka_adi = 'porsche'
	)
)
;

---***************************************************************************************************---
-- 8
---***************************************************************************************************---
--- Satıcıları ve araç sattıkları ya da kiraladıkları müşterileri göster

select musteri.ad, musteri.soyad, satici.ad, satici.soyad 
from odeme, satici, musteri
	where satici.satici_id = odeme.satici_id
	and 
	musteri.user_id = odeme.user_id 


---***************************************************************************************************---
-- 9
---***************************************************************************************************---
--- Kiralık olan araçların markalarını göster

select marka_id, marka_adi from marka
	where marka_id IN(
	select marka_id 
	from arac
		where ilan_no IN(
		select ilan_no
		from ilan
			where 	ilan_turu = 'kiralık'
	)	
);

---***************************************************************************************************---
-- 10
---***************************************************************************************************---
--- Satılmayan ya da kiralanmayan araçları göster

select marka_id, marka_adi from marka
	where not marka_id IN(
	select marka_id 
	from arac 
		where ilan_no IN(
		select ilan_no
		from ilan
			where  ilan_turu = 'satılık' or ilan_turu = 'kiralık'
	)	
);



 











