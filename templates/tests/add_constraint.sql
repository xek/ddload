ALTER TABLE vendors ADD CONSTRAINT vendors_vendor_name_city_country_unique UNIQUE (vendor_name, vendor_city, vendor_country);
